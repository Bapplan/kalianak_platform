IntegrityError at /admin/inventory/stockitem/add/
null value in column "current_stock" of relation "inventory_stockitem" violates not-null constraint
DETAIL:  Failing row contains (5, g, null, null, null, 1, Test Item, 100.00, 1000.00, 20000.00, ).
Request Method:	POST
Request URL:	http://localhost:8000/admin/inventory/stockitem/add/
Django Version:	5.2.8
Exception Type:	IntegrityError
Exception Value:	
null value in column "current_stock" of relation "inventory_stockitem" violates not-null constraint
DETAIL:  Failing row contains (5, g, null, null, null, 1, Test Item, 100.00, 1000.00, 20000.00, ).
Exception Location:	/usr/local/lib/python3.13/site-packages/django/db/backends/utils.py, line 105, in _execute
Raised during:	django.contrib.admin.options.add_view
Python Executable:	/usr/local/bin/python
Python Version:	3.13.3
Python Path:	
['/app',
 '/usr/local/lib/python313.zip',
 '/usr/local/lib/python3.13',
 '/usr/local/lib/python3.13/lib-dynload',
 '/usr/local/lib/python3.13/site-packages']
Server time:	Fri, 14 Nov 2025 10:21:14 +0700