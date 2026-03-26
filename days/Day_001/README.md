# Day 001: Linux User Setup with Non-Interactive Shell

### The Task
The system administration team required a new user for a backup agent tool on **App Server 2**. To ensure system security, the user must be created with a non-interactive shell, preventing any direct login while allowing the tool to execute its background processes.

### Requirements
* **Target Server:** App Server 2 (`stapp02`)
* **Username:** `jared`
* **Shell Type:** Non-interactive (`/sbin/nologin` or `/usr/sbin/nologin`)

### Implementation Steps

1. **User Creation**

Created the user account with a specific flag to assign a non-interactive shell. This ensures that even if someone obtained the credentials, they could not access the command line.

```bash
sudo useradd -s /sbin/nologin jared
```

2. **Verification of User Details**

Checked the `/etc/passwd` file to confirm the user was created successfully with the correct shell assignment.

```bash
grep jared /etc/passwd
```

*Expected Output: `jared:x:1001:1001::/home/jared:/sbin/nologin`*

### Verification

Attempted to switch to the new user to confirm the non-interactive shell is functioning correctly.

```bash
# Attempt to login as jared
sudo su - jared
```

*Result: The system should return a message stating "This account is currently not available," confirming the security constraint is in place.*
