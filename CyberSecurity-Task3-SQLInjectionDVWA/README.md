# Task 3 - SQL Injection on DVWA

## Objective

The objective of this task was to demonstrate a classic SQL Injection vulnerability using DVWA (Damn Vulnerable Web Application) with the security level set to Low.

## Environment

- Operating System: Kali Linux
- Web Server: Apache2
- Database: MariaDB
- PHP: PHP 8.4
- Application: DVWA
- Security Level: Low
- Module: SQL Injection

## DVWA Setup

DVWA was installed and configured on the local Kali Linux machine.

The application was accessed locally through:

http://localhost/DVWA/

The DVWA security level was changed to Low before performing the SQL Injection tests.

## What is SQL Injection?

SQL Injection is a web application vulnerability that occurs when user input is incorrectly included in an SQL query.

An attacker can manipulate the input so that the database executes unintended SQL conditions.

## Test 1

Payload used:

' OR '1'='1

The application returned multiple user records instead of a single matching record.

The results included:

- admin
- Gordon Brown
- Hack Me
- Pablo Picasso
- Bob Smith

This demonstrates that the SQL query was successfully manipulated by the supplied input.

Screenshot:

`sql_injection_1.png`

Video:

`SQL_Injection_Test_1.mp4`

## Test 2

Payload used:

1' OR '1'='1' #

The application again returned multiple user records.

The `#` character is used as a comment marker in MySQL/MariaDB, causing the remaining portion of the original query to be ignored.

Screenshot:

`sql_injection_2.png`

Video:

`SQL_Injection_Test_2.mp4`

## Why the Payload Works

The DVWA Low-security SQL Injection page is intentionally vulnerable because user input is inserted into an SQL query without using a safe parameterized query.

The injected input changes the logic of the SQL condition and can cause the query to return records that were not intended by the original input.

## Data Exposed

The injection returned multiple database records containing user IDs, first names, and surnames.

Examples included:

- admin
- Gordon Brown
- Hack Me
- Pablo Picasso
- Bob Smith

## How to Prevent SQL Injection

A developer should use parameterized queries or prepared statements instead of directly concatenating user input into SQL queries.

Additional protections include:

- Validate user input
- Use prepared statements
- Apply least-privilege database permissions
- Use secure database APIs
- Never trust raw user input

## Evidence

This folder contains:

- `README.md`
- `sql_injection_notes.md`
- `sql_injection_1.png`
- `sql_injection_2.png`
- `SQL_Injection_Test_1.mp4`
- `SQL_Injection_Test_2.mp4`

##Youtube
https://youtu.be/ZEeifY9SKGs
## Conclusion

The SQL Injection vulnerability was successfully demonstrated in a controlled local DVWA environment using Low security. Two different payloads were tested, and both resulted in multiple database records being returned.
