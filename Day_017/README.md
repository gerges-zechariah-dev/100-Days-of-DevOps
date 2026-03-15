# Day 017: Install and Configure PostgreSQL

## 📋 Task Overview

The application development team is preparing to deploy a new application that requires a **PostgreSQL backend**.  
Since the PostgreSQL server is already installed on the **Nautilus database server**, the objective was to configure the specific **user credentials and database environment** required for the application.

---

## 🎯 Requirements

| Requirement | Value |
|-------------|------|
| Target Server | Database Server (`stdb01`) |
| Database User | `kodekloud_sam` |
| Password | `YchZHRcLkL` |
| Database Name | `kodekloud_db1` |
| Constraint | Do **not** restart the PostgreSQL service |

---

## 🛠️ Implementation Steps

### 1️⃣ Create Database User

Used the `createuser` utility as the `postgres` system user to create the new application user.

```bash
sudo -u postgres createuser kodekloud_sam
```

---

### 2️⃣ Create Database

Initialized the new database instance intended for the application.

```bash
sudo -u postgres createdb kodekloud_db1
```

---

### 3️⃣ Configure User Authentication

Accessed the PostgreSQL interactive terminal to set a secure encrypted password for the newly created user.

```bash
sudo -u postgres psql
```

Inside the `psql` terminal:

```sql
ALTER USER kodekloud_sam WITH ENCRYPTED PASSWORD 'YchZHRcLkL';
```

---

### 4️⃣ Grant Privileges

Assigned full permissions to the user for the newly created database to ensure the application can perform all required operations.

```sql
GRANT ALL PRIVILEGES ON DATABASE kodekloud_db1 TO kodekloud_sam;
```

---

## 🧪 Verification

Verified the creation of the database and user roles within the PostgreSQL terminal.

```sql
-- List databases
\l

-- List users / roles
\du
```

Result: The **database and user were successfully created**, with the required privileges assigned, while the PostgreSQL service remained online throughout the process.
