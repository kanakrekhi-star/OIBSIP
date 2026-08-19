How It Works
This payload exploits the SQL query by injecting an always-true condition.

Original Query Logic:

sql
SELECT * FROM users WHERE id = '1';
Modified Query After Injection:

sql
SELECT * FROM users WHERE id = '' OR '1'='1';
Explanation:

The single quote (') closes the original string input

OR adds a logical condition to the WHERE clause

'1'='1' is always TRUE

This means the query returns ALL records instead of just one

Results
What Data Was Exposed:

All User IDs

All First Names

All Surnames

Observation:
The application displayed multiple user records instead of just the requested one. This confirms the injection successfully changed the query logic.

Screenshot
<img width="929" height="436" alt="01_sql_injection_basic" src="https://github.com/user-attachments/assets/7fa76b76-afbf-4d8b-b585-6dd5f67e358e" />


Payload 2
Payload
text
' OR 1=1 #
How It Works
This payload combines an always-true condition with a MySQL comment to bypass the query logic.

Original Query Logic:

sql
SELECT * FROM users WHERE id = '1';
Modified Query After Injection:

sql
SELECT * FROM users WHERE id = '' OR 1=1 #';
Explanation:

The single quote (') closes the original string input

OR 1=1 adds a condition that is always TRUE

# is a MySQL/MariaDB comment marker that comments out the rest of the query

Everything after # is ignored, preventing syntax errors

Results
What Data Was Exposed:

All User IDs

All First Names

All Surnames

Observation:
Same as Payload 1 - the application returned all user records. The # successfully commented out the remaining part of the query.

Screenshot
[Insert screenshot: 02_sql_injection_payload2.png]

Payload Comparison
Aspect	Payload 1	Payload 2
Payload	' OR '1'='1	' OR 1=1 #
Always-True Condition	'1'='1'	1=1
Uses Comment	No	Yes (#)
Database Compatibility	Universal	MySQL/MariaDB
Query Termination	Added single quote	Commented out rest
Success	✅ Yes	✅ Yes
Vulnerability Analysis
Why Did These Payloads Work?
No Input Validation: The application accepts any user input without checking its type or format

Direct Concatenation: User input is placed directly into the SQL query string

No Parameterization: Input is treated as SQL code instead of data

Error Messages: Database errors (if any) reveal information about the query structure

What Could an Attacker Do?
With these simple payloads, an attacker can:

Bypass authentication

View all user records

Extract sensitive information

With more advanced payloads, they could:

Extract password hashes

Modify or delete data

Access other database tables

Potentially execute system commands

How to Prevent SQL Injection
Method 1: Parameterized Queries (Prepared Statements)
PHP with MySQLi:

php
$stmt = $conn->prepare("SELECT * FROM users WHERE id = ?");
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();
PHP with PDO:

php
$stmt = $pdo->prepare("SELECT * FROM users WHERE id = :id");
$stmt->execute(['id' => $user_id]);
$result = $stmt->fetchAll();
Method 2: Input Validation
php
if (filter_var($user_id, FILTER_VALIDATE_INT)) {
    // Proceed with query
}
Method 3: Escape User Input (Last Resort)
php
$user_id = mysqli_real_escape_string($conn, $_GET['id']);
Method 4: Least Privilege Principle
Database accounts should have only necessary permissions

Use read-only accounts for SELECT queries

Key Takeaways
Always treat user input as data, not code

Use prepared statements - This is the most effective prevention method

Validate input - Check type, format, and size

Hide error messages from users

Use least privilege for database accounts

Ethics Statement
⚠️ WARNING: This testing was performed ONLY on a locally installed DVWA instance created specifically for security training purposes.

Ethical Guidelines:

Never attempt SQL injection on real websites

Always have explicit permission for security testing

Use this knowledge only for defensive purposes

Report vulnerabilities responsibly if found in production systems

References
PortSwigger Web Security Academy

OWASP SQL Injection Prevention Cheat Sheet

DVWA GitHub Repository

