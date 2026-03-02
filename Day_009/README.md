# Day 009: MariaDB Troubleshooting 

### The Task
There is a critical issue going on with the Nautilus application in Stratos DC. The production support team identified that the application is unable to connect to the database. After digging into the issue, the team found that **Mariadb **service is down on the database server.

### What was needed
* **Look into the issue and fix the it.**

### How I solved it
1. **Connection Test:**
`sudo mariadb -u root` -> Throws `ERROR 2002 (HY000)` (Socket missing).
2. **Logs Analysis:** Checked MariaDB Error Log 
Found in `/var/log/mariadb/mariadb.log`:
`[ERROR] mariadbd: Can't create/write to file '/run/mariadb/mariadb.pid' (Errcode: 13 "Permission denied")`
3. **Root Cause:**
The runtime directory `/run/mariadb` had incorrect ownership (root), preventing the `mysql` user from creating the mandatory PID file.

### Solution Commands
The solution is change ownership of the /run/mariadb directory from root to mysql.
```bash
sudo chown -R mysql:mysql /run/mariadb
sudo systemctl start mariadb
```

### Verification
* Ran `sudo systemctl is-active mariadb` (Result: active)
* Ran `ls -l /run/mariadb/mariadb.pid` to confirm the file was successfully created.
