# Day 002: Temporary User Setup with Expiry

## 📋 Task Overview

A developer named `rose` required temporary access to the Nautilus project on **App Server 2**.  
To maintain security and automated access control, the task was to create the user account with a predefined expiration date.

---

## 🎯 Requirements

| Requirement   | Value                         |
| ------------- | ----------------------------- |
| Target Server | `stapp02` (App Server 2)      |
| Username      | `rose` (must be lowercase)    |
| Expiry Date   | `2024-02-17`                  |

---

## 🛠️ Implementation Steps

### 1️⃣ User Creation with Expiration

Created the user account while simultaneously setting the account expiration date using the `-e` (expiry) flag.

```bash
sudo useradd -e 2024-02-17 rose
```

---

### 2️⃣ Account Details Verification

Used the `chage` command to inspect the account aging information and confirm the expiration date was applied correctly.

```bash
sudo chage -l rose
```

*Expected Output: `Account expires : Feb 17, 2024`*

---

### 3️⃣ Check User Presence

Verified the user entry exists within the system's password database.

```bash
id rose
```

---

## 🧪 Verification

To confirm the account status and the specific timestamp of the expiry, checked the shadow file (encrypted password file) where the expiry date is stored in days since the epoch.

```bash
sudo grep rose /etc/shadow
```

Result: The account is successfully configured to automatically lock after **2024-02-17**, ensuring no unauthorized access remains after the developer's assignment ends.
