# Printer setup

## Here is the architecture

1. iPad (React): Sends order to Django.

2. Django (Docker): Saves the order, then sends a request to your Mac Host.

3. Mac Host (Bridge Script): Receives the request and talks to the USB printer via macOS native system commands.

## Step 1: Install the Printer on macOS

## Step 2: Create the "Print Bridge" Script

Create a file named printer_bridge.py on your Mac (not in the container). This script acts as a server that your Docker container can talk to.

```py
# printer_bridge.py
# Run this on your Mac Host: python3 printer_bridge.py
from http.server import BaseHTTPRequestHandler, HTTPServer
import json
import os
import tempfile

PRINTER_NAME = "kitchen_printer"  # The name you set in System Settings

class PrintHandler(BaseHTTPRequestHandler):
    def do_POST(self):
        content_length = int(self.headers['Content-Length'])
        post_data = self.rfile.read(content_length)
        
        try:
            # 1. Parse the Receipt Text from Django
            data = json.loads(post_data)
            receipt_text = data.get('text', '')

            # 2. Save to a temporary file
            with tempfile.NamedTemporaryFile(mode='w+', delete=False) as temp:
                temp.write(receipt_text)
                temp_path = temp.name

            # 3. Send to Printer using macOS 'lp' command
            # '-o raw' is crucial for thermal printers to interpret control codes
            cmd = f"lp -d {PRINTER_NAME} -o raw {temp_path}"
            result = os.system(cmd)
            
            # 4. Cleanup
            os.unlink(temp_path)

            if result == 0:
                self.send_response(200)
                self.end_headers()
                self.wfile.write(b"Printed successfully")
            else:
                self.send_error(500, "Printing failed")

        except Exception as e:
            self.send_error(500, str(e))

if __name__ == "__main__":
    server_address = ('', 9001) # Listen on port 9001
    print(f"Print Bridge listening on port 9001... targeting '{PRINTER_NAME}'")
    httpd = HTTPServer(server_address, PrintHandler)
    httpd.serve_forever()
```

## Step 3: Configure Django (Docker) to talk to the Bridge

In your Django views (where you handle the "Order Created" logic), you simply send the receipt text to the bridge.

Crucial Docker Tip: To talk to the host machine from inside a container, use the special DNS name host.docker.internal.

```py
import requests

def print_receipt_to_kitchen(order_text):
    # In production, this might be a real IP. 
    # In dev, this points to your Mac running the python script.
    bridge_url = "http://host.docker.internal:9001" 
    
    try:
        response = requests.post(bridge_url, json={"text": order_text}, timeout=5)
        if response.status_code == 200:
            print("Successfully sent to kitchen printer")
        else:
            print("Printer bridge error:", response.text)
    except Exception as e:
        print(f"Could not connect to printer bridge: {e}")
```

## How to format the Receipt (The "ESC/POS" part)

Since thermal printers are dumb, sending just "text" often looks bad. You usually want to send ESC/POS commands (special codes that tell the printer "Bold", "Cut Paper", "Center Align").

For your order_text in Django, you can use a library like python-escpos or just manually format the string with magic bytes:

```py
# Simple example of ESC/POS formatting
# \x1b\x61\x01 = Center Align
# \x1b\x61\x00 = Left Align
# \x1d\x56\x42\x00 = Cut Paper

receipt = (
    "\x1b\x40"          # Initialize
    "\x1b\x61\x01"      # Center Align
    "IKAN BAKAR KALIANAK\n"
    "--------------------------------\n"
    "\x1b\x61\x00"      # Left Align
    "Order #101\n"
    "1x Ikan Bakar      50.000\n"
    "1x Nasi Putih       5.000\n"
    "--------------------------------\n"
    "\n\n\n"            # Feed lines
    "\x1d\x56\x42\x00"  # Cut Paper
)

print_receipt_to_kitchen(receipt)
```

### Summary of the Workflow

1. You: Run python3 printer_bridge.py in a Ghostty tab on your Mac.

2. iPad: You take an order on the React App (via ngrok).

3. Django: Receives order -> POSTs to host.docker.internal:9001.

4. Mac: The bridge script receives it -> fires lp command -> USB Printer prints.
