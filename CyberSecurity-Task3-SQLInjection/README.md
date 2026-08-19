Project Overview
This project demonstrates a classic SQL Injection vulnerability using Damn Vulnerable Web Application (DVWA) running locally on a Kali Linux system. The purpose is to understand how SQL Injection attacks work and how to prevent them.

Environment Setup
System Requirements
Operating System: Kali Linux (or Windows with XAMPP)

Web Server: Nginx (or Apache with XAMPP)

Database: MariaDB (or MySQL)

Application: DVWA (Damn Vulnerable Web Application)

Installation Steps
Install LAMP/XAMPP Stack

For Kali Linux: sudo apt install apache2 mariadb-server php php-mysql

For Windows: Download and install XAMPP from apachefriends.org

Download and Configure DVWA

bash
cd /var/www/html
sudo git clone https://github.com/digininja/DVWA.git
cd DVWA/config
sudo cp config.inc.php.dist config.inc.php
Database Setup

Open http://localhost/DVWA/setup.php in browser

Click "Create/Reset Database"

Default credentials: admin/password

Start Services

Kali: sudo systemctl start apache2 mariadb

Windows: Start Apache and MySQL via XAMPP Control Panel

SQL Injection Demonstration
Security Level Configuration
The DVWA security level was set to Low for this demonstration to expose the vulnerability intentionally.

Test 1: Basic SQL Injection
Payload: ' OR '1'='1

What It Does:

The condition '1'='1' is always TRUE

This modifies the SQL query to return ALL records instead of just one

SQL Query Breakdown:

text
Original: SELECT * FROM users WHERE id = '1';
Modified: SELECT * FROM users WHERE id = '' OR '1'='1';
Results: Exposed multiple database records including:

User IDs

First Names

Surnames

Test 2: Comment-Based Injection
Payload: ' OR 1=1 #

What It Does:

1=1 is always TRUE

# comments out the rest of the SQL query

This effectively changes the query logic

SQL Query Breakdown:

text
Original: SELECT * FROM users WHERE id = '1';
Modified: SELECT * FROM users WHERE id = '' OR 1=1 #';
Results: Same as Test 1 - exposed user records from the database

What is SQL Injection?
SQL Injection is a web application security vulnerability that occurs when untrusted user input is directly inserted into SQL queries without proper sanitization.

How It Works
User submits input through a web form

Application builds SQL query using this input

Attacker adds SQL code within the input

Database executes malicious code

Real-World Impact
Data Theft: Steal sensitive information

Data Manipulation: Modify or delete database records

Authorization Bypass: Access restricted areas

Server Compromise: In some cases, execute system commands

Why Did the Payload Work?
The payload worked because:

No Input Validation: The application accepts any user input

Direct Concatenation: Input is directly placed into SQL query

No Parameterization: Input is treated as code, not data

Error Disclosure: Error messages reveal database structure

Vulnerable Code Example
php
// VULNERABLE - DO NOT USE
$user_id = $_GET['id'];
$query = "SELECT * FROM users WHERE id = '$user_id'";
Prevention: How to Fix SQL Injection
Method 1: Parameterized Queries (Prepared Statements)
PHP (MySQLi):

php
// SAFE - Use prepared statements
$stmt = $conn->prepare("SELECT * FROM users WHERE id = ?");
$stmt->bind_param("i", $user_id);
$stmt->execute();
PHP (PDO):

php
// SAFE - Use prepared statements
$stmt = $pdo->prepare("SELECT * FROM users WHERE id = :id");
$stmt->execute(['id' => $user_id]);
Method 2: Input Validation
php
// SAFE - Validate input type
if (filter_var($user_id, FILTER_VALIDATE_INT)) {
    // Proceed with query
}
Method 3: Escape User Input
php
// SAFE - Escape special characters
$user_id = mysqli_real_escape_string($conn, $_GET['id']);
Method 4: Least Privilege Principle
Database accounts should have minimal necessary permissions

Read-only for viewing operations

No direct database access for web applications

Security Best Practices
Always Use Parameterized Queries: Never concatenate user input

Validate All Input: Check data type, format, and size

Use Secure Database Credentials: Avoid default passwords

Hide Error Details: Don't expose database structure

Implement Web Application Firewall (WAF): Additional protection layer

Regular Security Audits: Test for vulnerabilities

Keep Software Updated: Patch known vulnerabilities

Test Environment Details
Testing Platform: Local DVWA instance

Security Level: Low (for demonstration purposes)

Database: MariaDB

Purpose: Security education and awareness

Ethics Statement
⚠️ WARNING: This demonstration was performed ONLY on a locally installed DVWA instance created specifically for security training purposes.

Ethical Guidelines:

Never attempt SQL injection on real websites

Always have explicit permission for security testing

Use such knowledge only for defensive purposes

Report vulnerabilities responsibly if found in production systems

Additional Resources
PortSwigger Web Security Academy - Comprehensive SQL Injection guide

OWASP SQL Injection Prevention Cheat Sheet

DVWA GitHub Repository

Conclusion
This demonstration clearly shows how SQL Injection can expose sensitive data when applications fail to properly handle user input. The vulnerability exists primarily due to:

Lack of input validation

Direct concatenation in SQL queries

Absence of parameterized queries

Key Takeaway: Always treat user input as data, not code. Using prepared statements is the most effective and straightforward solution to prevent SQL Injection vulnerabilities.

