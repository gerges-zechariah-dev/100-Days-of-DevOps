# Day 014: Linux Process Troubleshooting

### The Task
The production support team of xFusionCorp Industries has deployed some of the latest monitoring tools to keep an eye on every service, application, etc. running on the systems. One of the monitoring systems reported about Apache service unavailability on one of the app servers in Stratos DC.

### Requirements
* **Action:** Identify the app host where `httpd` is down.
* **Target Port:** `6400`
* **Verification:** Ensure Apache is active and running on the correct port on all servers.
* **Constraints:** No website code is hosted yet; service status is the primary priority.

### Implementation Steps

1. **Service Audit**

Checked the Apache service status across all application servers to pinpoint the failure.

```bash
sudo systemctl status httpd
```

*Result: Identified that `httpd` was failed/inactive on **stapp01**.*

2. **Identify Port Conflict**

Attempted to start the service and found it could not bind to the port. Investigated which process was currently occupying port `6400`.

```bash
sudo ss -tulpn | grep 6400
```

*Result: Confirmed that the `sendmail` service was using port 6400, preventing Apache from starting.*

3. **Resolve Conflict & Reassign Port**

Stopped and disabled the conflicting service to free up the port for Apache.

```bash
# Stop and prevent sendmail from starting on boot
sudo systemctl stop sendmail
sudo systemctl disable sendmail
```

4. **Service Restoration**

Started the Apache service and verified it successfully bound to the required port.

```bash
sudo systemctl start httpd
sudo systemctl enable httpd
```

### Verification

Confirmed that Apache is now listening on port `6400` and the service is active.

```bash
# Check port binding
sudo ss -tulpn | grep :6400

# Confirm service status
sudo systemctl status httpd
```
