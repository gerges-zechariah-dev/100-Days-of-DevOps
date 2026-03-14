# Day 012: Linux Network Services

### The Task
Our monitoring tool has reported an issue in Stratos Datacenter. One of our app servers has an issue, as its Apache service is not reachable on port 8086 (which is the Apache port). The service itself could be down, the firewall could be at fault, or something else could be causing the issue.

### Requirements
* **Source of Issue:** App Server 1 (`stapp01`)
* **Target Port:** `8087`
* **Security:** Ensure connectivity without compromising jump host settings.
* **Constraints:** Do **not** alter the existing `index.html` file.

### Implementation Steps

1. **Diagnosis**

Checked the Apache service status to identify binding errors:

```bash
sudo systemctl status httpd
# Error found: (98)Address already in use: could not bind to address :8087
```

2. **Resolve Port Conflict**

Identified the process occupying the port and stopped it to free up the address:

```bash
# Locate the process
sudo ss -tulpn | grep 8087 

# Stop the conflicting service (sendmail)
sudo systemctl stop sendmail
```

3. **Service Initialization**

Started the web server now that the port was available:

```bash
sudo systemctl start httpd
```

4. **Firewall Configuration**

Inserted an `iptables` rule to allow external traffic to reach the target port:

```bash
sudo iptables -I INPUT 1 -p tcp --dport 8087 -j ACCEPT
```

### Verification

Ran a loop from the jump host to confirm all servers are reachable. A `200 OK` or `403 Forbidden` response confirms the port is open and listening.

```bash
for s in stapp01 stapp02 stapp03; do 
    echo -n "$s: "; curl -s -I http://$s:8087 | head -n 1; 
done
```
