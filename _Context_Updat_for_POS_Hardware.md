Context Update for POS Hardware:
We have successfully installed our thermal printer (Iware D260, 80mm) on the local network.
IP Address: 192.168.1.200
Port: 9100
Protocol: Raw TCP (ESC/POS commands)

Task:
I need you to write a TypeScript service in the "frontend app" that handles printing a receipt when an order's status is updated from pending to paid.
Technical Requirements:
Use the capacitor-tcp-socket plugin to connect to the printer's IP and port.
Create a function printPaidReceipt(order: Order) that converts the order data into a raw ESC/POS byte string or buffer.
ESC/POS Formatting Requirements:
Initialize the printer (ESC @).
Center alignment for the Header (Restaurant Name: "Ikan Bakar Kalianak") and Date/Order ID.
Left alignment for the items list (Item Name, Qty, Price).
Right alignment (or calculated spacing) for the Total Price.
Add 4 blank lines at the bottom so the text clears the auto-cutter.
Trigger the Auto-Cutter (GS V 66 0 or equivalent hex).
Network Handling:
Always wrap the connection in a try/catch/finally block.
You MUST ensure TcpSocket.disconnect() is called in the finally block, even if the print fails. Standard POS printers crash if connections are left hanging.
Integrate this into the UI component where the Cashier hits the "Mark as Paid" button. When the Django API returns a 200 OK for the payment, trigger this local print function.
Please generate the TypeScript service file (printerService.ts) and show me how to wire it up to the Cashier screen.
