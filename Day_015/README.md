# Day 015: Setup SSL for Nginx

### The Task
The system admins team of xFusionCorp Industries needs to deploy a new application on App Server 3 in Stratos Datacenter. They have some pre-requites to get ready that server for application deployment. Prepare the server as per requirements shared below:

### Requirements
* **Target Server:** App Server 3 (`stapp03`)
* **Web Server:** Nginx
* **SSL Assets:** `nautilus.crt` and `nautilus.key` (initially in `/tmp`)
* **Content:** An `index.html` file containing "Welcome!"
* **Verification:** Successful HTTPS connection via `curl -Ik`.

### Implementation Steps

1. **Nginx Installation**

Installed the Nginx package and initialized the service to ensure it remains active across reboots.

```bash
sudo yum install nginx -y
sudo systemctl enable --now nginx
```

2. **Secure Certificate Management**

Moved the SSL certificate and private key to standard system locations and restricted permissions on the private key to ensure security.

```bash
# Move assets to appropriate system paths
sudo mv /tmp/nautilus.crt /etc/pki/tls/certs/
sudo mv /tmp/nautilus.key /etc/pki/tls/private/

# Restrict private key access to root only
sudo chmod 600 /etc/pki/tls/private/nautilus.key
```

3. **Document Root Setup**

Created the landing page for the application in the default Nginx HTML directory.

```bash
echo "Welcome!" | sudo tee /usr/share/nginx/html/index.html
```

4. **SSL Configuration & Service Restart**

Configured Nginx to use the moved SSL assets (via a dedicated `/etc/nginx/conf.d/ssl.conf` file) and restarted the service to apply changes.

```bash
sudo systemctl restart nginx
```

### Verification

From the Jump Host, verified the deployment using a secure curl request. The `-k` flag is used to allow the self-signed certificate.

```bash
# Test HTTPS connectivity and headers
curl -Ik https://stapp03/
```

*Result: HTTP/1.1 200 OK and "Welcome!" content served over port 443.*
