# Day 025: Git Merge Branches

## 📋 Task Overview
The Nautilus development team completed a feature update that introduced a new `index.html` file. The task involved creating a feature branch, adding the new file, committing the change, and merging the feature branch back into `master` before synchronizing all branches with the remote repository.

---

## 🎯 Requirements
| Requirement | Value |
|-------------|------|
| Target Server | `ststor01` |
| Repository Path | `/usr/src/kodekloudrepos/cluster` |
| New Branch | `datacenter` |
| Source File | `/tmp/index.html` |
| Objective | Merge `datacenter` into `master` and push all branches to `origin` |

---

## 🛠️ Implementation Steps

### 1️⃣ Navigate to the Repository
Accessed the cluster repository on the storage server.

```bash
cd /usr/src/kodekloudrepos/cluster
```

---

### 2️⃣ Create and Switch to the Feature Branch
Created a new branch for the update and switched the working directory to it.

```bash
git branch datacenter
git switch datacenter
```

---

### 3️⃣ Add the New File to the Repository
Copied the provided file into the repository working tree.

```bash
cp /tmp/index.html ./
```

---

### 4️⃣ Stage and Commit the Changes
Added the file to the Git index and committed it to record the update in the project history.

```bash
git add index.html
git commit -m "docs: add index.html to repository"
```

---

### 5️⃣ Merge the Feature Branch into Master
Switched back to the `master` branch and merged the feature branch to integrate the changes into the main codebase.

```bash
git switch master
git merge datacenter
```

---

### 6️⃣ Push All Branches to the Remote Repository
Synchronized the local repository with the remote origin, ensuring both branches were available to the team.

```bash
git push --all origin
```

---

## 🧪 Verification

### Confirm File Presence in Master Branch
```bash
ls -l index.html
```

### Validate Commit and Merge History
```bash
git log --oneline --graph --all
```

Expected history should display the `datacenter` branch commit merged into `master`.

**Result:**  
The `index.html` file was successfully committed on the `datacenter` branch, merged into `master`, and pushed to the remote repository. Both local and remote repositories are fully synchronized and reflect the updated project history.
