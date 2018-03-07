-- taken from here:
-- https://stackoverflow.com/questions/5108876/kill-a-postgresql-session-connection

SELECT *, pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE pid <> pg_backend_pid()
AND datname = 'cameras_dev';
