# Day 004: Script Execution Permissions

## 📋 Task Overview

In a bid to automate backup processes, the **xFusionCorp Industries** sysadmin team has developed a new bash script named `xfusioncorp.sh`.  
While the script has been distributed to all necessary servers, it lacks executable permissions on **App Server 1** within the Stratos Datacenter.  
Your task is to grant executable permissions to the `/tmp/xfusioncorp.sh` script on App Server 1 and ensure all users can execute it.

---

## 🎯 Requirements

| Requirement   | Value |
| ------------- | ----- |
| Target Server | App Server 1 (`stapp01`) |
| File Path     | `/tmp/xfusioncorp.sh` |
| Objective     | Grant execute (`x`) permissions to User, Group, and Others |

---

## 🛠️ Implementation Steps

### 1️⃣ Verify Current Permissions

Checked the existing permission set of the file to confirm it was not executable.

```bash
ls -l /tmp/xfusioncorp.sh
```

---

### 2️⃣ Grant Executable Permissions

Applied the execute bit for all users (Owner, Group, and Others) to ensure the backup automation can be triggered by any authorized system process or user.

```bash
sudo chmod +x /tmp/xfusioncorp.sh
```

*Alternatively, using octal notation:*

```bash
sudo chmod 755 /tmp/xfusioncorp.sh
```

---

### 3️⃣ Verify Changes

Re-inspected the file to ensure the `x` bit is now present in the permission string.

```bash
ls -l /tmp/xfusioncorp.sh
```

*Expected Output: `-rwxr-xr-x ... /tmp/xfusioncorp.sh`*

---

## 🧪 Verification

Executed the script to confirm that the shell now recognizes the file as a runnable program.

```bash
/tmp/xfusioncorp.sh
```

Result: The script executes successfully without a **"Permission denied"** error, allowing the automated backup process to proceed.
