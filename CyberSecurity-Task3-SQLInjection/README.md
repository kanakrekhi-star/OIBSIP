# Task 3 - SQL Injection on DVWA

## Objective

The objective of this task was to demonstrate a classic SQL Injection
vulnerability using Damn Vulnerable Web Application (DVWA).

The testing was performed only on a locally installed DVWA instance
running on Kali Linux.

---

## Tools and Technologies

- Kali Linux
- DVWA (Damn Vulnerable Web Application)
- Nginx
- PHP
- MariaDB
- Web Browser
- Terminal

---

## 1. DVWA Installation and Configuration

DVWA was installed and configured locally on Kali Linux.

The required web application components were configured, including
PHP, MariaDB, and the DVWA service.

The DVWA database was initialized before testing.

The DVWA application was then started locally and accessed through the
local web server.

The default DVWA login was used to access the application.

---

## 2. DVWA Security Level

After logging into DVWA, the security level was set to:

```text
Low

3. SQL Injection Module

The SQL Injection module was opened from the DVWA web interface.

The module contains an input field where a User ID can normally be
entered.

Under normal conditions, the application should use the supplied User
ID to retrieve the corresponding database record.

4. SQL Injection Payload 1
Payload
' OR '1'='1
Explanation

The expression:

'1'='1'

is always TRUE.

At the Low security level, DVWA does not properly protect the user
input before using it in the SQL query. Therefore, the injected input
can change the logic of the original SQL query.

Result

The injection caused multiple database records to be returned instead
of only the expected record.

The displayed information included:

User ID
First Name
Surname
Screenshot

5. SQL Injection Payload 2
Payload
' OR 1=1 #
Explanation

The expression:

1=1

is always TRUE.

The # character is a MySQL/MariaDB comment marker. It causes the
remaining part of the original SQL statement to be treated as a
comment.

This can allow the injected condition to change the query logic.

Result

The second SQL Injection test was performed successfully on the local
DVWA application.

The actual output obtained during testing is shown in the following
screenshot.

Screenshot

6. What Data Was Exposed?

The successful SQL Injection demonstrated that the application could
return database records that were not intended to be returned for a
single User ID.

The displayed information included:

User IDs
First Names
Surnames

This demonstrated that the SQL query could be manipulated through
untrusted user input.

7. What Is SQL Injection?

SQL Injection is a web application vulnerability that occurs when
untrusted user input is directly included in an SQL query.

Instead of being treated only as data, the input can be interpreted as
part of the SQL command.

This can allow an attacker to manipulate the intended query and
potentially access or modify database information.

8. Why Did the Payload Work?

The payload worked because the application at DVWA's Low security level
does not properly protect the input before using it in the SQL query.

For example:

' OR '1'='1

contains a condition that is always TRUE.

Similarly:

' OR 1=1 #

uses an always-true condition and a SQL comment.

This changes the intended logic of the query.

9. How to Prevent SQL Injection

Developers should never directly concatenate untrusted user input into
SQL statements.

The recommended solution is to use:

Parameterized queries
Prepared statements
Input validation
Least-privilege database accounts
Safe error handling

A vulnerable query may conceptually look like:

SELECT * FROM users WHERE id = '$user_input';

A safer approach is:

SELECT * FROM users WHERE id = ?;

The user input is supplied separately as a parameter.

This ensures that input such as:

' OR 1=1 #

is treated as data instead of being interpreted as SQL syntax.

Prepared statements therefore prevent user input from changing the
structure of the SQL query.

10. Evidence

The following screenshots document the two SQL Injection tests:

01_sql_injection_payload1.png
<img width="929" height="436" alt="01_sql_injection_basic" src="https://github.com/user-attachments/assets/5269bf80-6591-4e86-b1be-ba2e5ac78856" />

02_sql_injection_payload2.png
<img width="664" height="439" alt="02_sql_injection_payload2" src="https://github.com/user-attachments/assets/28716e0e-2782-4e9f-b426-0f18ad2e36b8" />


Detailed payload testing and analysis are available in:

sql_injection_notes.md

11. Ethics

All testing was performed only against a locally installed DVWA
instance created specifically for security training.

No real website, external server, database, or unauthorized system was
targeted.
