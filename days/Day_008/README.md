# Day 008: Install Ansible 

### The Task
The Nautilus team decided to start testing with **Ansible** for automation and configuration management. The goal was to install **ansible version 4.8.0** on the Jump host using **pip3**.

### What was needed
* **pip3** (Python package manager).
* **Global availability:** The Ansible binary must be accessible to all users on the system.
* **Specific version:** 4.8.0

### How I solved it
1. **Version Control:** Used `pip3 install` with the specific version flag `ansible==4.8.0`.
2. **Global Access:** To make it available globally, I ran the installation with `sudo` to ensure the binary is placed in a global path like `/usr/local/bin`.
3. **Verification:** Ran `ansible --version` to confirm the installation and version number.

### Solution Commands
```bash
sudo pip3 install ansible==4.8.0
ansible --version
```
