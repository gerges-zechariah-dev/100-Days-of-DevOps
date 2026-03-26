# Day 007: Linux SSH Authentication

## 📋 Task Overview

To facilitate automated administrative scripts, the system admins team required **password-less SSH access** from the Jump Host to all application servers.  
Specifically, the `thor` user on the Jump Host must be able to authenticate to each app server's sudo user without being prompted for a password.

---

## 🎯 Requirements

| Requirement | Value |
| ----------- | ----- |
| Source      | Jump Host (User: `thor`) |
| Targets     | App Server 1 (`stapp01`, User: `tony`) <br> App Server 2 (`stapp02`, User: `steve`) <br> App Server 3 (`stapp03`, User: `banner`) |
| Objective   | Configure SSH Key-Based Authentication |

---

## 🛠️ Implementation Steps

### 1️⃣ Generate SSH Key Pair

On the Jump Host, generated a public/private RSA key pair for the `thor` user.  
Pressed enter to accept default paths and left the passphrase empty.

```bash
ssh-keygen -t rsa
```

---

### 2️⃣ Distribute Public Key to App Servers

Copied the public key to each application server.  
This automatically appends the key to the `authorized_keys` file of the target user.

```bash
# Copy to App Server 1
ssh-copy-id tony@stapp01

# Copy to App Server 2
ssh-copy-id steve@stapp02

# Copy to App Server 3
ssh-copy-id banner@stapp03
```

---

### 3️⃣ Verify Permissions

Ensured the `.ssh` directory and `authorized_keys` file on the target servers have the correct restricted permissions to allow the SSH daemon to accept the keys.

```bash
# Standard permissions (usually handled by ssh-copy-id)
# Directory: 700 | File: 600
```

---

## 🧪 Verification

Attempted to log in to each server from the Jump Host.  
The connection should be established immediately without a password prompt.

```bash
ssh tony@stapp01
ssh steve@stapp02
ssh banner@stapp03
```

Result: The `thor` user can now execute remote commands and scripts across the entire Stratos Datacenter infrastructure seamlessly, enabling full automation of background maintenance tasks.
