# Day 020: Configure Nginx + PHP-FPM Using Unix Socket

## 📋 Task Overview

The objective was to deploy a **PHP-based application** on App Server 3 using **Nginx** as the web server and **PHP-FPM 8.1** for processing dynamic content.

To improve performance and security, communication between Nginx and PHP-FPM was configured using a **Unix socket** instead of a TCP port.

---

## 🎯 Requirements

| Requirement | Value |
|-------------|------|
| Target Server | App Server 3 (`stapp03`) |
| Web Server | Nginx |
| PHP Version | PHP-FPM 8.1 |
| Nginx Port | `8095` |
| Document Root | `/var/www/html` |
| Socket Path | `/var/run/php-fpm/default.sock` |
| Constraint | Do **not** modify `index.php` or `info.php` |

---

## 🛠️ Implementation Steps

### 1️⃣ Install and Configure Nginx

Installed Nginx and configured it to listen on port `8095` with the correct document root.

```bash
sudo yum install nginx -y
sudo systemctl enable --now nginx
```

Edit the main configuration:

```bash
sudo vi /etc/nginx/nginx.conf
```

Update inside the server block:

```nginx
listen       8095;
root         /var/www/html;
```

---

### 2️⃣ Install PHP-FPM 8.1

Enabled the PHP 8.1 module and installed the PHP-FPM service.

```bash
sudo yum module install php:8.1 -y
sudo systemctl enable --now php-fpm
```

---

### 3️⃣ Configure PHP-FPM to Use Unix Socket

Modified the PHP-FPM pool configuration to use a Unix socket instead of TCP.

**File:** `/etc/php-fpm.d/www.conf`

```ini
user = nginx
group = nginx

listen = /var/run/php-fpm/default.sock
listen.owner = nginx
listen.group = nginx
listen.mode = 0660
```

---

### 4️⃣ Configure Nginx to Process PHP via Socket

Updated the Nginx configuration to forward `.php` requests to the PHP-FPM socket.

```nginx
location ~ \.php$ {
    try_files $uri =404;
    fastcgi_pass unix:/var/run/php-fpm/default.sock;
    fastcgi_index index.php;
    fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    include fastcgi_params;
}
```

---

### 5️⃣ Resolve Default Configuration Conflict

Nginx loads additional configuration files from:

```
/etc/nginx/default.d/
```

The default `php.conf` file points to TCP port `9000`, which conflicts with the Unix socket configuration.  
To prevent configuration override, all lines in this file were commented out.

```bash
sudo vi /etc/nginx/default.d/php.conf
```

---

### 6️⃣ Set Permissions and Restart Services

Ensured the socket directory and web root have proper ownership and permissions, then restarted services.

```bash
sudo chown -R nginx:nginx /var/run/php-fpm /var/www/html
sudo chmod -R 755 /var/run/php-fpm

sudo systemctl restart php-fpm
sudo systemctl reload nginx
```

---

## 🧪 Verification

From the Jump Host, verified that Nginx successfully serves PHP files through the Unix socket.

```bash
curl http://stapp03:8095/index.php
```

Result: The PHP application is correctly processed by **PHP-FPM 8.1** via a Unix socket and served by Nginx on port `8095`.
