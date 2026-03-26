# Day 005: SELinux Installation and Configuration

## 📋 Task Overview

Following a security audit, the **xFusionCorp Industries** security team has opted to enhance application and server security with SELinux.  
For **App Server 2** in the Stratos Datacenter: install required SELinux packages, and permanently disable SELinux for now (the server will be rebooted as part of scheduled maintenance tonight).  
Disregard current runtime status; the final post-reboot state should be **disabled**.

---

## 🎯 Requirements

| Requirement    | Value |
| -------------- | ----- |
| Target Server  | App Server 2 (`stapp02`) |
| Packages       | `selinux-policy`, `selinux-policy-targeted`, `libselinux-utils` |
| Configuration  | Permanently set SELinux state to `disabled` |
| Constraint     | Ensure configuration persists across reboot |

---

## 🛠️ Implementation Steps

### 1️⃣ Install SELinux Packages

Installed the necessary policy and utility packages required to support SELinux features on the server.

```bash
sudo yum install selinux-policy selinux-policy-targeted libselinux-utils -y
```

---

### 2️⃣ Modify SELinux Configuration File

Updated the main configuration file to ensure SELinux is disabled at the kernel level upon the next boot.

**Configuration File**

```
/etc/selinux/config
```

Action: Change the `SELINUX=` directive from `enforcing` or `permissive` to `disabled`.

```bash
# Open the configuration file
sudo vi /etc/selinux/config

# Update the following line:
SELINUX=disabled
```

---

### 3️⃣ Verify Configuration File

Confirmed that the changes were correctly written to prevent any boot-time conflicts.

```bash
grep "SELINUX=" /etc/selinux/config
```

*Expected Output: `SELINUX=disabled` (excluding commented lines).*

---

## 🧪 Verification

While the task specifies disregarding the current runtime status, the configuration was double-checked against the system's management files to ensure persistence.

```bash
cat /etc/selinux/config | grep ^SELINUX=
```

Result: The configuration is set to **disabled**. After the scheduled maintenance reboot, the kernel will load with SELinux deactivated as requested by the security team.
