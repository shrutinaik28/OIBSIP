# Task 2 - Basic Firewall Configuration with UFW

## Objective

Set up and configure a basic firewall on Kali Linux using UFW (Uncomplicated Firewall). The configuration allows required network traffic and blocks HTTP traffic to improve the security of the system.

## What is a Firewall?

A firewall is a security system that controls network traffic entering and leaving a computer or network. It uses rules to allow or block connections based on factors such as ports, protocols, and source addresses.

## What is UFW?

UFW stands for Uncomplicated Firewall. It is a user-friendly command-line interface for managing firewall rules on Linux systems. UFW makes it easier to configure the Linux firewall without working directly with complex firewall commands.

## Firewall Configuration

### 1. Install UFW

Command used:

```bash
sudo apt install ufw
```

UFW was installed on the Kali Linux system.

### 2. Enable UFW

Command used:

```bash
sudo ufw enable
```

This activates the firewall so that the configured rules are enforced.

### 3. Allow SSH - Port 22

Command used:

```bash
sudo ufw allow ssh
```

SSH normally uses TCP port 22. This rule allows SSH connections so that authorized users can remotely administer the Linux system.

### 4. Deny HTTP - Port 80

Command used:

```bash
sudo ufw deny http
```

HTTP normally uses TCP port 80. This rule blocks incoming HTTP connections.

### 5. Allow HTTPS - Port 443

Command used:

```bash
sudo ufw allow https
```

HTTPS normally uses port 443. This rule allows secure web traffic.

### 6. Allow DNS - Port 53

Command used:

```bash
sudo ufw allow 53
```

DNS commonly uses port 53. This rule allows DNS traffic required for domain-name resolution.

## Default Policies

The following default policies were configured:

```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
```

Incoming connections are denied by default unless an explicit rule allows them. Outgoing connections are allowed so that the system can communicate with external services normally.

## Why These Rules Were Chosen

The rules were selected to demonstrate both allowing and blocking network traffic.

- SSH (22) is allowed because it is commonly used for remote administration.
- HTTP (80) is denied to demonstrate blocking an unwanted or insecure web service.
- HTTPS (443) is allowed because secure web communication commonly uses this port.
- DNS (53) is allowed because DNS is needed for domain-name resolution.
- Denying incoming traffic by default provides a more restrictive baseline and reduces unnecessary network exposure.

## Verification

The active firewall rules were verified using:

```bash
sudo ufw status verbose
```

The output showed that UFW was active and contained the configured allow/deny rules.

Evidence screenshot:

`ufw_result.png`

## Testing That HTTP Traffic Was Blocked

The HTTP blocking rule was tested from the Windows host against the Kali Linux machine.

Kali Linux IP address:

```text
192.168.130.128
```

The following PowerShell command was used on Windows:

```powershell
Test-NetConnection 192.168.130.128 -Port 80
```

The test showed:

```text
PingSucceeded       : True
TcpTestSucceeded    : False
```

This means the Kali machine was reachable, but a TCP connection to port 80 could not be established, demonstrating that the HTTP port was blocked.

Evidence screenshot:

`http_block_test.png`

## Configuration Script

The firewall rules are also provided in:

```text
ufw_configuration.sh
```

The script applies the default policies, firewall rules, enables UFW, and displays the final firewall status.

## Conclusion

UFW was successfully configured on Kali Linux. SSH traffic on port 22 and HTTPS traffic on port 443 were allowed, HTTP traffic on port 80 was denied, and DNS traffic on port 53 was allowed. The final configuration was verified and the HTTP deny rule was tested successfully.
