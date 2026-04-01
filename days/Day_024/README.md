# Day 024: Create a New Git Branch

## 📋 Task Overview
The Nautilus development team began work on new features for the `cluster` application. To maintain stability of the production code, a separate feature branch was required. The task involved creating a new branch from the `master` branch on the Storage Server, allowing parallel development without modifying the main codebase.

---

## 🎯 Requirements
| Requirement | Value |
|-------------|------|
| Target Server | `ststor01` |
| Repository Path | `/usr/src/kodekloudrepos/cluster` |
| Base Branch | `master` |
| New Branch Name | `xfusioncorp_cluster` |
| Constraints | No code changes permitted |

---

## 🛠️ Implementation Steps

### 1️⃣ Navigate to the Repository
Accessed the project repository directory on the storage server.

```bash
cd /usr/src/kodekloudrepos/cluster
```

---

### 2️⃣ Verify Current Branch State
Checked the list of existing branches and confirmed the current HEAD position.

```bash
git branch
```

---

### 3️⃣ Switch to the Base Branch
Ensured the new branch would be created from the latest state of the `master` branch.

```bash
git checkout master
# or
git switch master
```

---

### 4️⃣ Create the Feature Branch
Created a new branch without modifying any tracked files.

```bash
git branch xfusioncorp_cluster
```

---

### 5️⃣ Switch to the New Branch
Updated the working directory to use the newly created branch so that future commits would be tracked there.

```bash
git checkout xfusioncorp_cluster
# or
git switch xfusioncorp_cluster
```

---

## 🧪 Verification

### Confirm Branch Creation and Active Status
```bash
git branch
```

Expected output:
```
  master
* xfusioncorp_cluster
```

**Result:**  
The branch `xfusioncorp_cluster` was successfully created from `master` and is now the active working branch, enabling isolated development while keeping the main branch unchanged.
