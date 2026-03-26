# Day 018: Install and Configure MariaDB Server

## 📋 Task Overview

The objective was to set up a new **MariaDB database server** on the Nautilus DB Server.  
This involved installing the service, creating a specific database, and configuring a user with the necessary permissions for application access.

---

## 🎯 Requirements

| Requirement | Value |
|-------------|------|
| Target Server | Database Server (`stdb01`) |
| Database Name | `kodekloud_db3` |
| Database User | `kodekloud_roy` |
| Password | `B4zNgHA7Ya` |
| Permissions | Full privileges on `kodekloud_db3` |

---

## 🛠️ Implementation Steps

### 1️⃣ Install and Initialize MariaDB

Installed the MariaDB server and client packages, then enabled the service to ensure it starts automatically on boot.

```bash
sudo dnf install mariadb mariadb-server -y
sudo systemctl enable --now mariadb.service
```

---

### 2️⃣ User and Database Creation

Accessed the MariaDB shell to create the required database and application user.

```sql
-- Create the application database
CREATE DATABASE kodekloud_db3;

-- Create the user with local access only
CREATE USER 'kodekloud_roy'@'localhost' IDENTIFIED BY 'B4zNgHA7Ya';
```

---

### 3️⃣ Privilege Management

Granted full permissions to the new user specifically for the new database and refreshed the grant tables to apply changes.

```sql
GRANT ALL PRIVILEGES ON kodekloud_db3.* TO 'kodekloud_roy'@'localhost';
FLUSH PRIVILEGES;
```

---

## 🧪 Verification

Ran audits within the MariaDB shell to confirm the user exists and holds the correct permissions.

```sql
-- Verify user existence and host binding
SELECT User, Host FROM mysql.user WHERE User = 'kodekloud_roy';

-- Confirm permissions
SHOW GRANTS FOR 'kodekloud_roy'@'localhost';
```

Result: MariaDB is successfully configured with the `kodekloud_db3` database and the `kodekloud_roy` user, ready for application connection.
