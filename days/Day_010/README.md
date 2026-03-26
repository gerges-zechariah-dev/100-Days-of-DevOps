# Day 010: Linux Bash Scripts 

### The Task
The production support team of xFusionCorp Industries is working on developing some bash scripts to automate different day to day tasks. One is to create a bash script for taking websites backup. They have a static website running on App Server 3 in Stratos Datacenter, and they need to create a bash script named ecommerce_backup.sh which should accomplish the following tasks. (Also remember to place the script under /scripts directory on App Server 3).

### Requirements
* **Source:** ``/var/www/html/ecommerce``

* **Archive Name:** ``xfusioncorp_ecommerce.zip``

* **Local Backup Path:** ``/backup/``

* **Remote Backup Path:** ``Nautilus Backup Server`` at ``/backup/``

* **Security:** Must use passwordless SSH (no ``sudo`` inside the script).

* **Permissions:** Executable by the server user (e.g., ``banner``).

### Implementation Steps
1. **Environment Setup**
Install the necessary archiving tools on App Server 3:
```bash
sudo dnf install zip unzip -y
```
2. **Establish Passwordless SSH**
To allow ``scp`` to run without a password prompt, generate a key on App Server 3 and share it with the Backup Server:
```bash
ssh-keygen -t rsa
ssh-copy-id clint@stbkp01
```
3. **The Backup Script**
Location: ``/scripts/ecommerce_backup.sh``
```bash
#!/bin/bash

zip -r /backup/xfusioncorp_ecommerce.zip /var/www/html/ecommerce

scp /backup/xfusioncorp_ecommerce.zip natasha@ststor01:/backup/
```
4. **Permissions**
Ensure the script is executable by the assigned user:
```bash
chmod +x /scripts/ecommerce_backup.sh
```

### Verification
Run the script manually to ensure no password prompts appear and the file arrives safely:
```bash
sh /scripts/ecommerce_backup.sh
```
