# Day 019: Install and Configure Web Application

## 📋 Task Overview

xFusionCorp Industries is preparing to host two static websites in the Stratos Datacenter.  
While the websites are still in development, the infrastructure must be ready to serve them.  

The objective was to configure **Apache** on App Server 3 to serve two separate applications on a **custom port**.

---

## 🎯 Requirements

| Requirement | Value |
|-------------|------|
| Target Server | App Server 3 (`stapp03`) |
| Package | `httpd` |
| Target Port | `6300` |
| Applications | `ecommerce`, `apps` |
| Access Paths | `/ecommerce/`, `/apps/` |

---

## 🛠️ Implementation Steps

### 1️⃣ Install and Enable Apache

Installed the Apache web server package and ensured the service starts automatically on boot.

```bash
sudo yum install httpd -y
sudo systemctl enable --now httpd
```

---

### 2️⃣ Configure Custom Port

Modified the Apache configuration to listen on port `6300` instead of the default port `80`.

* **File Path:** `/etc/httpd/conf/httpd.conf`

```bash
sudo vi /etc/httpd/conf/httpd.conf
```

Update the `Listen` directive:

```apache
Listen 6300
```

---

### 3️⃣ Deploy Website Assets

Transferred the application directories from the Jump Host to the App Server and moved them into the Apache document root.

```bash
# On Jump Host
scp -r /home/thor/ecommerce /home/thor/apps banner@stapp03:/tmp/
```

```bash
# On App Server 3
sudo mv /tmp/apps /var/www/html/
sudo mv /tmp/ecommerce /var/www/html/
sudo chown -R apache:apache /var/www/html/
```

---

### 4️⃣ Apply Changes

Restarted Apache to apply configuration changes and load the new content.

```bash
sudo systemctl restart httpd
```

---

## 🧪 Verification

Tested both applications locally using `curl` to confirm they are accessible on the custom port.

```bash
# Test ecommerce application
curl -I http://localhost:6300/ecommerce/

# Test apps application
curl -I http://localhost:6300/apps/
```

Result: Both applications are successfully served via their respective paths on port `6300`.
