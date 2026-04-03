# Day 027: Git Revert Some Changes

## 📋 Task Overview
The Nautilus development team reported an issue with the most recent updates pushed to the `ecommerce` repository. To restore stability while maintaining a clear audit trail, the DevOps team was tasked with reverting the `HEAD` commit. Unlike a reset, a revert creates a new "inverse" commit, which is the safest approach for shared repositories.

---

## 🎯 Requirements
| Requirement | Value |
|-------------|------|
| Target Server | `ststor01` |
| Repository Path | `/usr/src/kodekloudrepos/ecommerce` |
| Target Action | Revert the latest commit (`HEAD`) |
| Commit Message | `revert ecommerce` |

---

## 🛠️ Implementation Steps

### 1️⃣ Access the Repository and Review Logs
Navigated to the project directory and checked the commit history to confirm the current `HEAD`.

```bash
cd /usr/src/kodekloudrepos/ecommerce
sudo git log --oneline
```

---

### 2️⃣ Execute the Revert
Ran the revert command on the latest commit. This creates a new commit that undoes the changes introduced previously.

```bash
sudo git revert HEAD
```

---

### 3️⃣ Update Commit Message
When prompted with the default commit message in the editor, updated the first line to match the required format:

```
revert ecommerce
```

Saved and exited the editor to complete the operation.

---

## 🧪 Verification

### Confirm Revert Commit
```bash
sudo git log -n 2 --oneline
```

You should see:
- The new `revert ecommerce` commit at the top
- The previous commit right below it

---

### Validate Repository State
```bash
ls -la
```

Confirmed that the changes introduced in the last commit are no longer present.

---

**Result:**  
The latest commit was successfully reverted using a new inverse commit. The repository is now back to a stable state while preserving full commit history for traceability.
