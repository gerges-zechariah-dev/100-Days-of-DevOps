# Day 003: Secure Root SSH Access

## 📋 Task Overview

To comply with new security protocols at **xFusionCorp Industries**, direct root access via SSH needed to be disabled across the entire application infrastructure.  
This ensures that administrators must log in with their individual accounts and escalate privileges as needed, creating a better audit trail.

---

## 🎯 Requirements

| Requirement | Value |
|-------------|------|
| Target Servers | `stapp01`, `stapp02`, `stapp03` |
| Security Protocol | Disable `PermitRootLogin` in SSH configuration |
| Service | SSH Daemon (`sshd`) |

---

## 🛠️ Implementation Steps

### 1️⃣ Modify SSH Configuration

Accessed each app server and edited the primary SSH configuration file to disable root login permissions.

**Configuration File**

```
/etc/ssh/sshd_config
```

Action: Locate the `PermitRootLogin` directive and change its value to `no`.

```bash
# Edit the configuration file
sudo vi /etc/ssh/sshd_config

# Ensure the line looks like this:
PermitRootLogin no
```

---

### 2️⃣ Validate Configuration Syntax

Before restarting the service, checked the configuration for any syntax errors to avoid locking out legitimate users.

```bash
sudo sshd -t
```

---

### 3️⃣ Restart SSH Service

Reloaded the SSH daemon to apply the new security settings.

```bash
sudo systemctl restart sshd
```

---

## 🧪 Verification

Attempted to SSH directly as `root` from the Jump Host to confirm the restriction is active.

```bash
# Attempt direct root login
ssh root@stapp01
```

Result: The server should return **"Permission denied"** or **"Connection closed"**, even if the correct password is provided. Access is now only possible via standard user accounts (e.g., `tony`, `steve`, `banner`).
