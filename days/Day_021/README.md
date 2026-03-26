# Day 021: Set Up Git Repository on Storage Server

## 📋 Task Overview

The Nautilus development team requested a **centralized Git repository** for a new application project.  
The objective was to configure a **bare Git repository** on the Storage Server to act as a remote origin for developers to push and pull code.

---

## 🎯 Requirements

| Requirement | Value |
|-------------|------|
| Target Server | Storage Server (`ststor01`) |
| Package | `git` |
| Repository Path | `/opt/media.git` |
| Repository Type | Bare |

---

## 🛠️ Implementation Steps

### 1️⃣ Install Git

Installed the Git version control system using the package manager.

```bash
sudo yum install git -y
```

---

### 2️⃣ Create Repository Directory

Created the required directory under the `/opt` partition where the repository will reside.

```bash
sudo mkdir -p /opt/media.git
```

---

### 3️⃣ Initialize Bare Repository

Navigated into the directory and initialized it as a **bare repository**.  
Bare repositories do not contain a working directory and are designed to function as centralized remotes.

```bash
cd /opt/media.git
sudo git init --bare
```

---

### 4️⃣ Set Repository Permissions

Adjusted permissions to ensure the repository is accessible for collaborative Git operations.

```bash
sudo chmod -R 775 /opt/media.git
```

---

## 🧪 Verification

Verified that Git successfully initialized the repository by checking for standard Git administrative files and directories.

```bash
ls -l /opt/media.git
```

Expected structure includes:

```
HEAD
config
description
hooks/
info/
objects/
refs/
```

Result: The `/opt/media.git` directory contains the expected Git structure, confirming that the centralized bare repository is ready to be used as a remote origin.
