anders@vmi3083326:/opt/kalianak$ docker exec kalianak_backend python manage.py shell -c "                                                                                                                                       
  from apps.users.models import Restaurant                                                                                                                                                       
  Restaurant.objects.filter(code='KLN1').update(name='Kalianak Depot 1')                                                                                                                         
  Restaurant.objects.filter(code='KLN2').update(name='Kalianak Depot 2')                                                                                                                         
  print('Done')
  "
46 objects imported automatically (use -v 2 for details).

Traceback (most recent call last):
  File "/app/manage.py", line 23, in <module>
    main()
    ~~~~^^
  File "/app/manage.py", line 19, in main
    execute_from_command_line(sys.argv)
    ~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^
  File "/usr/local/lib/python3.13/site-packages/django/core/management/__init__.py", line 443, in execute_from_command_line
    utility.execute()
    ~~~~~~~~~~~~~~~^^
  File "/usr/local/lib/python3.13/site-packages/django/core/management/__init__.py", line 437, in execute
    self.fetch_command(subcommand).run_from_argv(self.argv)
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^
  File "/usr/local/lib/python3.13/site-packages/django/core/management/base.py", line 420, in run_from_argv
    self.execute(*args, **cmd_options)
    ~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.13/site-packages/django/core/management/base.py", line 464, in execute
    output = self.handle(*args, **options)
  File "/usr/local/lib/python3.13/site-packages/django/core/management/commands/shell.py", line 261, in handle
    exec(options["command"], {**globals(), **self.get_namespace(**options)})
    ~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "<string>", line 2
    from apps.users.models import Restaurant                                                                                                                                                       
IndentationError: unexpected indent
anders@vmi3083326:/opt/kalianak$ docker exec kalianak_backend /app/.venv/bin/python manage.py shell -c "
  from apps.users.models import Restaurant
  Restaurant.objects.filter(code='KLN1').update(name='Kalianak Depot 1')
  Restaurant.objects.filter(code='KLN2').update(name='Kalianak Depot 2')
  print('Done')
  "
Traceback (most recent call last):
  File "/app/manage.py", line 23, in <module>
    main()
    ~~~~^^
  File "/app/manage.py", line 19, in main
    execute_from_command_line(sys.argv)
    ~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^
  File "/app/.venv/lib/python3.13/site-packages/django/core/management/__init__.py", line 442, in execute_from_command_line
    utility.execute()
    ~~~~~~~~~~~~~~~^^
  File "/app/.venv/lib/python3.13/site-packages/django/core/management/__init__.py", line 416, in execute
    django.setup()
    ~~~~~~~~~~~~^^
  File "/app/.venv/lib/python3.13/site-packages/django/__init__.py", line 24, in setup
    apps.populate(settings.INSTALLED_APPS)
    ~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/app/.venv/lib/python3.13/site-packages/django/apps/registry.py", line 91, in populate
    app_config = AppConfig.create(entry)
  File "/app/.venv/lib/python3.13/site-packages/django/apps/config.py", line 193, in create
    import_module(entry)
    ~~~~~~~~~~~~~^^^^^^^
  File "/usr/local/lib/python3.13/importlib/__init__.py", line 88, in import_module
    return _bootstrap._gcd_import(name[level:], package, level)
           ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "<frozen importlib._bootstrap>", line 1387, in _gcd_import
  File "<frozen importlib._bootstrap>", line 1360, in _find_and_load
  File "<frozen importlib._bootstrap>", line 1324, in _find_and_load_unlocked
ModuleNotFoundError: No module named 'storages'