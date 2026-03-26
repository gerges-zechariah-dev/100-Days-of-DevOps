# Day 016: Install and Configure Nginx as an LBR

## 📋 Task Overview

Day by day traffic is increasing on one of the websites managed by the **Nautilus production support team**, causing performance degradation.  
To address this, the team decided to deploy a **high availability stack**. The migration is almost complete, with only the **Load Balancer (LBR) server configuration** pending.

The objective is to install **Nginx** on the LBR server and configure it to **balance incoming traffic across all App Servers**.

---

## 🎯 Requirements

| Requirement | Value |
|-------------|------|
| Target Server | LBR Server (`stlb01`) |
| Backend Servers | `stapp01`, `stapp02`, `stapp03` |
| Configuration File | `/etc/nginx/nginx.conf` |
| Action | Configure Nginx to load balance traffic |
| Constraints | Do not modify Apache ports on app servers |

---

## 🛠️ Implementation Steps

### 1️⃣ Install Nginx on LBR

Installed the Nginx package on the **Load Balancer server** to handle incoming HTTP traffic.

```bash
sudo yum install nginx -y
```

---

### 2️⃣ Configure Upstream and Proxy Pass

Updated the main Nginx configuration file.

**Configuration File**

```
/etc/nginx/nginx.conf
```

Defined an **upstream group** inside the `http` context to include all backend servers.

```nginx
upstream app_servers {
    server stapp01:8086;
    server stapp02:8086;
    server stapp03:8086;
}
```

Modified the existing **server block**:

- Commented out the default `root` directive
- Added a proxy rule to forward traffic to the upstream group

```nginx
location / {
    proxy_pass http://app_servers;
}
```

---

### 3️⃣ Enable Apache on Backend Servers

Logged into all application servers and ensured the Apache web service is active so the load balancer has healthy backend targets.

```bash
sudo systemctl enable --now httpd
```

---

### 4️⃣ Test and Reload Configuration

Validated the configuration syntax before applying changes to prevent downtime.

```bash
# Check configuration syntax
sudo nginx -t

# Reload nginx to apply changes
sudo systemctl reload nginx
```

---

## 🧪 Verification

Accessed the website through the **Load Balancer** from the Jump Host.

```bash
curl http://stlb01:80
```

Result: The **LBR successfully distributes traffic** to the backend application servers and returns the expected website content.
