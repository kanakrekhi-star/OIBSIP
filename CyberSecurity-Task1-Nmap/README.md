# OIBSIP Task 1 - Basic Network Scanning with Nmap

## Objective

The objective of this task is to perform a basic network security scan on an authorized local computer using Nmap.

The scan was performed on my own Windows computer using Kali Linux through WSL.

The assessment included:

- Basic network scanning
- Service and version detection
- Operating system detection
- Open port identification
- Basic security analysis
- Documentation of scan results

---

## Target Information

| Information  | Details                              |
| ------------ | ------------------------------------ |
| Target IP    | 192.168.0.103                        |
| Target       | My own Windows computer              |
| Scanner      | Kali Linux through WSL               |
| Nmap Version | 7.99                                 |
| Scan Type    | Local/authorized security assessment |

The target computer belongs to me, and the scans were performed only for educational purposes as part of the OIBSIP Cyber Security Internship.

---

## What is Nmap?

Nmap, short for Network Mapper, is a network scanning and security auditing tool.

It can be used to discover hosts on a network, identify open ports, detect services, identify service versions, and sometimes determine the operating system of a target.

Nmap is commonly used by cybersecurity professionals for network security assessment and reconnaissance.

---

## Why Network Scanning Matters

Network scanning is important because it helps identify systems and services that are accessible over a network.

Security professionals can use scanning to:

- Discover active systems
- Identify open ports
- Identify running network services
- Check service versions
- Detect possible security exposure
- Understand firewall and network filtering
- Support security assessments

Regular network scanning can help organizations understand their network exposure and identify services that may need additional security controls.

---

## Tools Used

### Nmap

Nmap was used to perform the network scans.

### Kali Linux

Kali Linux was used as the scanning environment through WSL.

### Windows

The target system was my own Windows computer.

---

## Nmap Installation

Nmap was installed in Kali Linux using the following commands:

```bash
sudo apt update
sudo apt install nmap -y
