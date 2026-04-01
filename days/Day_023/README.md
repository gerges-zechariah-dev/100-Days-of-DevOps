# Day 023: Fork a Git Repository

## 📋 Task Overview
A new developer joined the Nautilus team and required an isolated workspace to begin contributing to the `story-blog` application. The task involved using the internal Gitea platform to create a fork of an existing repository under the developer’s personal namespace, ensuring independent development without impacting the original codebase.

---

## 🎯 Requirements
| Requirement | Value |
|-------------|------|
| Platform | Gitea Web UI |
| User | `jon` |
| Source Repository | `sarah/story-blog` |
| Destination Repository | `jon/story-blog` |
| Gitea URL | `http://gitea.stratos.dc` |

---

## 🛠️ Implementation Steps

### 1️⃣ Access the Gitea Web Interface
Opened the internal Gitea server using a web browser.

```
http://gitea.stratos.dc
```

---

### 2️⃣ Authenticate as the Developer
Logged in using the provided developer credentials to ensure the fork would be created under the correct user namespace.

```
Username: jon
Password: Jon_pass123
```

---

### 3️⃣ Locate the Source Repository
Searched for and opened the repository owned by Sarah.

```
sarah/story-blog
```

---

### 4️⃣ Fork the Repository
Used the Gitea interface to create a fork of the repository:

- Clicked **Fork** on the repository page
- Confirmed the destination namespace as **jon**
- Initiated the fork operation

This created a full copy of the repository under Jon’s account while preserving a reference to the original upstream project.

---

## 🧪 Verification

### Confirm Fork Creation in User Namespace
Navigated to Jon’s repositories and verified that the forked repository exists.

```
http://gitea.stratos.dc/jon/story-blog
```

### Validate Upstream Reference
Checked the repository header to ensure it displays:

```
forked from sarah/story-blog
```

**Result:**  
The repository was successfully forked to `jon/story-blog`. The fork maintains a link to the upstream source, enabling future pull requests and synchronization with the original project.
