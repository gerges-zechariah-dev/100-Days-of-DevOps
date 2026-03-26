# Day 013: IPtables Installation and Configuration

### The Task
We have one of our websites up and running on our Nautilus infrastructure in Stratos DC. Our security team has raised a concern that right now Apache’s port i.e 6200 is open for all since there is no firewall installed on these hosts. So we have decided to add some security layer for these hosts and after discussions and recommendations we have come up with the following requirements

### Requirements
* **Action:** Install and enable `iptables` on all app hosts.
* **Whitelist:** Allow incoming traffic on port `6200` only from the **LBR host**.
* **Blacklist:** Reject port `6200` traffic from all other sources.
* **Persistence:** Ensure rules remain active after a system reboot.

### Implementation Steps

1. **Install and Enable IPtables**

Installed the necessary services and dependencies, then enabled the service to ensure it starts on boot.

```bash
sudo yum install iptables-services -y
sudo systemctl enable --now iptables
```

2. **Verify Connectivity**

Confirmed the LBR host IP address and verified reachability before applying restrictions.

```bash
# Verify connection to Load Balancer host
ping -c 2 stlb01
```

3. **Configure Firewall Rules**

Inserted a specific allow rule for the LBR IP and a secondary rule to reject all other traffic on the target port.

```bash
# 1. Allow LBR
sudo iptables -I INPUT -p tcp -s 172.16.238.14 --dport 6200 -j ACCEPT

# 2. Reject everyone else on that port
sudo iptables -A INPUT -p tcp --dport 6200 -j REJECT
```

4. **Persistence**

Saved the current runtime rules to the configuration file so they survive a reboot.

```bash
sudo iptables-save | sudo tee /etc/sysconfig/iptables
```

### Verification

Checked the active rule chain with line numbers to ensure the **ACCEPT** rule sits above the **REJECT** rule.

```bash
sudo iptables -nL --line-numbers
```

*Result: Traffic from LBR IP is accepted on port `6200`, while all other incoming TCP traffic on port `6200` is rejected.*
