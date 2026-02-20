Collecting static files...
System check identified some issues:

WARNINGS:
?: (staticfiles.W004) The directory '/app/static' in the STATICFILES_DIRS setting does not exist.

0 static files copied to '/app/staticfiles', 135 unmodified.
Applying database migrations...
System check identified some issues:

WARNINGS:
?: (staticfiles.W004) The directory '/app/static' in the STATICFILES_DIRS setting does not exist.
Operations to perform:
  Apply all migrations: admin, auth, bank, contenttypes, expenses, inventory, menu, orders, pos, sessions, users
Running migrations:
  Applying inventory.0020_alter_stockitem_unique_together... OK
  Applying inventory.0021_restockorder_restockitem... OK
  Applying inventory.0022_remove_hygiene_max_stock_remove_hygiene_restaurant_and_more... OK
  Applying menu.0009_alter_modifier_unique_together_remove_modifier_group_and_more... OK
  Applying menu.0010_alter_dish_options... OK
  Applying orders.0017_order_restaurant_table_restaurant... OK
  Applying pos.0001_initial... OK
  Applying sessions.0001_initial... OK
  Applying users.0003_alter_staffmember_role... OK
  Applying users.0004_customer... OK
Starting server...
Performing system checks...

System check identified some issues:

WARNINGS:
?: (staticfiles.W004) The directory '/app/static' in the STATICFILES_DIRS setting does not exist.

System check identified 1 issue (0 silenced).
February 19, 2026 - 18:44:51
Django version 6.0.2, using settings 'core.settings'
Starting development server at http://0.0.0.0:8000/
Quit the server with CONTROL-C.

WARNING: This is a development server. Do not use it in a production setting. Use a production WSGI or ASGI server instead.
For more information on production servers see: https://docs.djangoproject.com/en/6.0/howto/deployment/