# Day 026: Git Manage Remotes

## 📋 Task Overview
Following infrastructure updates, the DevOps team needed to configure an additional Git remote for the `ecommerce` project on the Storage Server. The task involved adding a new remote repository, committing a required file, and synchronizing the local `master` branch with the newly defined upstream location.

---

## 🎯 Requirements
| Requirement | Value |
|-------------|------|
| Target Server | `stapp01` |
| Repository Path | `/usr/src/kodekloudrepos/ecommerce` |
| New Remote Name | `dev_ecommerce` |
| Remote URL | `/opt/xfusioncorp_ecommerce.git` |
| File to Add | `/tmp/index.html` |
| Objective | Commit file and push `master` to new remote |

---

## 🛠️ Implementation Steps

### 1️⃣ Navigate to the Repository
Accessed the ecommerce project directory on the storage server.

```bash
cd /usr/src/kodekloudrepos/ecommerce
```

---

### 2️⃣ Add the New Remote Repository
Configured a new remote named `dev_ecommerce` pointing to the provided repository path.

```bash
git remote add dev_ecommerce /opt/xfusioncorp_ecommerce.git
```

---

### 3️⃣ (If Required) Correct the Remote URL
In case of an incorrect path during initial configuration, updated the remote URL using:

```bash
git remote set-url dev_ecommerce /opt/xfusioncorp_ecommerce.git
```

---

### 4️⃣ Add the Required File to the Repository
Copied the provided file into the working directory.

```bash
cp /tmp/index.html ./
```

---

### 5️⃣ Stage and Commit the Changes
Tracked the new file in the repository and committed the change.

```bash
git add index.html
git commit -m "docs: add index.html for ecommerce project"
```

---

### 6️⃣ Push the Master Branch to the New Remote
Synchronized the local repository with the newly configured remote.

```bash
git push dev_ecommerce master
```

---

## 🧪 Verification

### Confirm Remote Configuration
```bash
git remote -v
```

Expected output should include:
```
dev_ecommerce  /opt/xfusioncorp_ecommerce.git (fetch)
dev_ecommerce  /opt/xfusioncorp_ecommerce.git (push)
```

---

### Verify Remote Branch Availability
```bash
git branch -a
```

**Result:**  
The new remote `dev_ecommerce` was successfully configured, the `index.html` file was committed, and the `master` branch was pushed to the remote repository, ensuring synchronization with the updated infrastructure.
