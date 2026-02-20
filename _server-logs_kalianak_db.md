The files belonging to this database system will be owned by user "postgres".
This user must also own the server process.

The database cluster will be initialized with locale "en_US.utf8".
The default database encoding has accordingly been set to "UTF8".
The default text search configuration will be set to "english".

Data page checksums are disabled.

fixing permissions on existing directory /var/lib/postgresql/data ... ok
creating subdirectories ... ok
selecting dynamic shared memory implementation ... posix
selecting default max_connections ... 100
selecting default shared_buffers ... 128MB
selecting default time zone ... UTC
creating configuration files ... ok
running bootstrap script ... ok
sh: locale: not found
2026-02-18 18:06:23.316 UTC [35] WARNING:  no usable system locales were found
performing post-bootstrap initialization ... ok
syncing data to disk ... ok


Success. You can now start the database server using:

    pg_ctl -D /var/lib/postgresql/data -l logfile start

initdb: warning: enabling "trust" authentication for local connections
initdb: hint: You can change this by editing pg_hba.conf or using the option -A, or --auth-local and --auth-host, the next time you run initdb.
waiting for server to start....2026-02-18 18:06:24.615 UTC [41] LOG:  starting PostgreSQL 15.16 on x86_64-pc-linux-musl, compiled by gcc (Alpine 15.2.0) 15.2.0, 64-bit
2026-02-18 18:06:24.618 UTC [41] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
2026-02-18 18:06:24.627 UTC [44] LOG:  database system was shut down at 2026-02-18 18:06:24 UTC
2026-02-18 18:06:24.641 UTC [41] LOG:  database system is ready to accept connections
 done
server started
CREATE DATABASE


/usr/local/bin/docker-entrypoint.sh: ignoring /docker-entrypoint-initdb.d/*

waiting for server to shut down....2026-02-18 18:06:24.825 UTC [41] LOG:  received fast shutdown request
2026-02-18 18:06:24.829 UTC [41] LOG:  aborting any active transactions
2026-02-18 18:06:24.835 UTC [41] LOG:  background worker "logical replication launcher" (PID 47) exited with exit code 1
2026-02-18 18:06:24.835 UTC [42] LOG:  shutting down
2026-02-18 18:06:24.837 UTC [42] LOG:  checkpoint starting: shutdown immediate
2026-02-18 18:06:24.901 UTC [42] LOG:  checkpoint complete: wrote 921 buffers (5.6%); 0 WAL file(s) added, 0 removed, 0 recycled; write=0.035 s, sync=0.025 s, total=0.067 s; sync files=301, longest=0.002 s, average=0.001 s; distance=4239 kB, estimate=4239 kB
2026-02-18 18:06:24.916 UTC [41] LOG:  database system is shut down
 done
server stopped

PostgreSQL init process complete; ready for start up.

2026-02-18 18:06:24.968 UTC [1] LOG:  starting PostgreSQL 15.16 on x86_64-pc-linux-musl, compiled by gcc (Alpine 15.2.0) 15.2.0, 64-bit
2026-02-18 18:06:24.968 UTC [1] LOG:  listening on IPv4 address "0.0.0.0", port 5432
2026-02-18 18:06:24.968 UTC [1] LOG:  listening on IPv6 address "::", port 5432
2026-02-18 18:06:24.972 UTC [1] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
2026-02-18 18:06:24.979 UTC [57] LOG:  database system was shut down at 2026-02-18 18:06:24 UTC
2026-02-18 18:06:24.991 UTC [1] LOG:  database system is ready to accept connections
2026-02-18 18:11:25.008 UTC [55] LOG:  checkpoint starting: time
2026-02-18 18:11:28.034 UTC [55] LOG:  checkpoint complete: wrote 33 buffers (0.2%); 0 WAL file(s) added, 0 removed, 0 recycled; write=3.016 s, sync=0.004 s, total=3.027 s; sync files=11, longest=0.002 s, average=0.001 s; distance=141 kB, estimate=141 kB
2026-02-18 18:36:25.380 UTC [55] LOG:  checkpoint starting: time
2026-02-18 18:36:52.626 UTC [55] LOG:  checkpoint complete: wrote 273 buffers (1.7%); 0 WAL file(s) added, 0 removed, 0 recycled; write=27.209 s, sync=0.026 s, total=27.246 s; sync files=360, longest=0.002 s, average=0.001 s; distance=2148 kB, estimate=2148 kB
2026-02-19 11:46:39.748 UTC [55] LOG:  checkpoint starting: time
2026-02-19 11:46:57.047 UTC [55] LOG:  checkpoint complete: wrote 172 buffers (1.0%); 1 WAL file(s) added, 0 removed, 0 recycled; write=17.203 s, sync=0.014 s, total=17.300 s; sync files=113, longest=0.004 s, average=0.001 s; distance=996 kB, estimate=2033 kB
2026-02-19 11:51:39.097 UTC [55] LOG:  checkpoint starting: time
2026-02-19 11:51:42.644 UTC [55] LOG:  checkpoint complete: wrote 36 buffers (0.2%); 0 WAL file(s) added, 0 removed, 0 recycled; write=3.530 s, sync=0.007 s, total=3.548 s; sync files=25, longest=0.004 s, average=0.001 s; distance=26 kB, estimate=1832 kB
2026-02-19 11:56:39.745 UTC [55] LOG:  checkpoint starting: time
2026-02-19 11:56:41.474 UTC [55] LOG:  checkpoint complete: wrote 18 buffers (0.1%); 0 WAL file(s) added, 0 removed, 0 recycled; write=1.717 s, sync=0.004 s, total=1.730 s; sync files=12, longest=0.002 s, average=0.001 s; distance=2 kB, estimate=1649 kB
2026-02-19 12:03:07.287 UTC [92088] FATAL:  role "ikan_bakar_db" does not exist
2026-02-19 12:09:38.759 UTC [92716] FATAL:  role "ikan_bakar_db" does not exist
2026-02-19 12:10:15.406 UTC [92773] FATAL:  role "ikan_bakar_db" does not exist