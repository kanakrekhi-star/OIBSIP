#!/bin/bash

# Oasis Infobyte - Cyber Security Internship
# Task 2: Basic Firewall Configuration with UFW

set -e

echo "======================================"
echo " UFW Firewall Configuration"
echo "======================================"

echo "[1] Installing UFW..."
sudo apt update
sudo apt install ufw -y

echo "[2] Setting default policies..."
sudo ufw default deny incoming
sudo ufw default allow outgoing

echo "[3] Allowing SSH (Port 22)..."
sudo ufw allow ssh

echo "[4] Denying HTTP (Port 80)..."
sudo ufw deny http

echo "[5] Allowing HTTPS (Port 443)..."
sudo ufw allow https

echo "[6] Denying FTP (Port 21)..."
sudo ufw deny ftp


echo "[7] Enabling UFW..."
sudo ufw --force enable

echo "[8] Final UFW status..."
sudo ufw status verbose

echo "======================================"
echo " UFW configuration completed."
echo "======================================"
