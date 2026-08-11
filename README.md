# Task 2 — Basic Firewall Configuration with UFW

## Objective

The objective of this task is to set up and configure a basic firewall on Kali Linux using UFW (Uncomplicated Firewall). The firewall was configured to allow and deny specific types of incoming network traffic.

## Tools Used

- Kali Linux
- UFW (Uncomplicated Firewall)
- Linux Terminal
- Git and GitHub

## What is a Firewall?

A firewall is a security mechanism that controls network traffic entering or leaving a system based on predefined rules. It helps protect a computer from unauthorized network access.

UFW is a simplified firewall management tool for Linux that provides an easy way to create firewall rules using simple commands.

## Firewall Configuration

The following rules were configured:

| Port | Service | Action | Purpose |
|------|---------|--------|---------|
| 22 | SSH | ALLOW | Allows SSH connections |
| 80 | HTTP | DENY | Blocks incoming HTTP traffic |
| 443 | HTTPS | ALLOW | Allows secure HTTPS traffic |
| 21 | FTP | DENY | Blocks incoming FTP traffic |

### SSH — Port 22

SSH was allowed because it is commonly used for secure remote administration of Linux systems.

Command:

```bash
sudo ufw allow ssh
