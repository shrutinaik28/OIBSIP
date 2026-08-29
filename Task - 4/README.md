# TASK 4 — Exploit a SQL Injection Vulnerability (Advanced)

## Executive Summary

This project demonstrates the security risks of SQL Injection using Damn
Vulnerable Web Application (DVWA) running locally.

The testing was performed against a local DVWA instance at `127.0.0.1`
using the Medium security level and Burp Suite Repeater.

The vulnerability allowed SQL queries to be manipulated through user input.
During testing, database tables, column names, usernames, and password
hashes were successfully exposed.

### Business Impact

A SQL Injection vulnerability can allow an attacker to access information
that should be protected. Depending on the application's database
permissions, this could lead to:

- Unauthorized access to sensitive information
- Exposure of customer or employee data
- Disclosure of password hashes
- Modification or deletion of database records
- Potential compromise of the application and database

The overall risk is considered **High** because SQL Injection can directly
affect the confidentiality and integrity of application data.

---

## Environment

- Application: DVWA (Damn Vulnerable Web Application)
- Target: `127.0.0.1`
- Operating System: Kali Linux
- Web Server: Apache
- Database: MariaDB
- Security Level: Medium
- Testing Tool: Burp Suite Repeater

All testing was performed against the locally hosted DVWA application.

---

## SQL Injection Testing

### 1. Basic SQL Injection

A basic SQL injection payload was tested through the SQL Injection module.

Payload:

```text
id=1' OR 1=1 -- -
