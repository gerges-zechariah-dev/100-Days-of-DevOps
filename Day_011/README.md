# Day 010: Install and Configure Tomcat Server

## 📋 Task Overview

The production support team of **xFusionCorp Industries** is deploying a Java-based beta application.
The objective is to deploy the application on **App Server 1** using the **Tomcat application server**, while making it accessible on a **custom port instead of the default**.

---

## 🎯 Requirements

| Requirement   | Value                                                           |
| ------------- | --------------------------------------------------------------- |
| Target Server | `stapp01` (App Server 1)                                        |
| Target Port   | `5003`                                                          |
| Artifact      | `ROOT.war`                                                      |
| Access Path   | `/` (base URL)                                                  |
| Dependency    | Java Development Kit (JDK)                                      |
| Constraints   | Limited permissions between Jump Host and protected directories |

---

## 🛠️ Implementation Steps

### 1️⃣ Environment Setup & Installation

Install the **Java Development Kit (JDK)** and the **Tomcat server**.
Java is a mandatory dependency for Tomcat to execute `.war` files.

```bash
sudo yum install java-17-openjdk-devel tomcat -y
```

---

### 2️⃣ Custom Port Configuration

By default, **Tomcat listens on port `8080`**.
To meet the requirement of **port `5003`**, the Tomcat configuration must be modified.

**Configuration File**

```
/usr/share/tomcat/conf/server.xml
```

Locate the `<Connector>` tag and update the port value.

```xml
<Connector port="5003" protocol="HTTP/1.1"
           connectionTimeout="20000"
           redirectPort="8443" />
```

---

### 3️⃣ Permission-Aware Deployment Strategy

The application artifact (`ROOT.war`) resides on the **Jump Host**.
Because the `tony` user **cannot directly copy files into protected system directories**, a **two-step transfer** is required.

#### Step 1 — Transfer to Temporary Directory

Copy the artifact from the Jump Host to the App Server's `/tmp` directory.

```bash
scp /tmp/ROOT.war tony@stapp01:/tmp/
```

#### Step 2 — Move with Elevated Privileges

Move the file into the Tomcat deployment directory using `sudo`.

```bash
sudo mv /tmp/ROOT.war /usr/share/tomcat/webapps/
```

> **Insight:**
> Naming the artifact `ROOT.war` ensures the application is served at the **base URL (`/`)** rather than a sub-path.

---

### 4️⃣ Service Initialization

Enable the Tomcat service to start automatically on boot and restart it to apply configuration changes.

```bash
# Enable service at boot and start it immediately
sudo systemctl enable --now tomcat

# Restart to apply server.xml changes
sudo systemctl restart tomcat
```

---

## 🧪 Verification

Confirm that the service is running on the correct port and the application is accessible.

```bash
# Check if Tomcat is listening on port 5003
sudo ss -tulpn | grep :5003
```

```bash
# Verify the application is reachable
curl -I http://stapp01:5003
```

Successful output should return an **HTTP response header**, confirming the application is accessible.
