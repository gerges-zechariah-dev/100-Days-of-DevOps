# Day 006: Create a Cron Job

## 📋 Task Overview

The Nautilus system admins team has prepared scripts to automate several day-to-day tasks.  
They want them deployed on all app servers in Stratos DC on a schedule. Before that, they needed to test similar functionality with a **sample cron job** for the root user.

---

## 🎯 Requirements

| Requirement    | Value |
| -------------- | ----- |
| Target Servers | `stapp01`, `stapp02`, `stapp03` |
| Package        | `cronie` |
| Service        | `crond` |
| Schedule       | `*/5 * * * *` (Every 5 minutes) |
| Command        | `echo hello > /tmp/cron_text` |
| User           | `root` |

---

## 🛠️ Implementation Steps

### 1️⃣ Install and Enable Cron Service

Installed the `cronie` package, which provides the standard crond daemon, and ensured the service is active and set to start on boot.

```bash
# Install the package
sudo yum install cronie -y

# Start and enable the service
sudo systemctl enable --now crond
```

---

### 2️⃣ Configure the Cron Job

Accessed the crontab for the root user to add the scheduled task.

```bash
# Open root's crontab editor
sudo crontab -e
```

*Added the following line to the file:*

```text
*/5 * * * * echo hello > /tmp/cron_text
```

---

### 3️⃣ Verify Crontab Entry

Confirmed that the cron job was successfully saved and is listed under the root user's scheduled tasks.

```bash
sudo crontab -l
```

*Expected Output: `*/5 * * * * echo hello > /tmp/cron_text`*

---

## 🧪 Verification

Monitored the `/tmp` directory to ensure the file is created or updated according to the 5-minute schedule.

```bash
# Check for the existence of the file
ls -l /tmp/cron_text

# Verify the content of the file
cat /tmp/cron_text
```

Result: The file `/tmp/cron_text` is successfully updated every 5 minutes with the word **"hello"**, confirming the cron daemon is functioning as expected across the app servers.
