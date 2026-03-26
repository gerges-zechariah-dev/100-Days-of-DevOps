# Day 022: Clone Git Repository on Storage Server

## 📋 Task Overview
Following the setup of the internal version control system, the Nautilus development team required a working copy of an existing Git repository on the **Storage Server**. The objective was to perform a standard clone operation into a designated system directory using a non-privileged user account, while preserving existing permissions and repository structure.

---

## 🎯 Requirements
| Requirement | Value |
|-------------|------|
| Target Server | `ststor01` |
| User | `natasha` |
| Source Repository | `/opt/apps.git` |
| Destination Directory | `/usr/src/kodekloudrepos` |
| Constraints | No changes to directory permissions or repository configuration |

---

## 🛠️ Implementation Steps

### 1️⃣ Connect to the Storage Server
Logged into the storage server using the designated non-privileged user to ensure the operation adhered to the required security context.

```bash
ssh natasha@ststor01
```

---

### 2️⃣ Navigate to the Destination Directory
Changed to the directory where the repository needed to be cloned.

```bash
cd /usr/src/kodekloudrepos
```

---

### 3️⃣ Clone the Repository
Cloned the existing bare repository from the local path into the destination directory. Git automatically created a working directory named after the repository (`apps`).

```bash
git clone /opt/apps.git
```

---

## 🧪 Verification

### Confirm Repository Directory Creation
```bash
ls -la /usr/src/kodekloudrepos
```

### Validate Git Metadata and History
```bash
cd /usr/src/kodekloudrepos/apps
git log --oneline
```

**Result:**  
The repository was successfully cloned into `/usr/src/kodekloudrepos/apps`. The working tree, `.git` metadata, and commit history are present, confirming a complete and valid clone without altering system permissions.
