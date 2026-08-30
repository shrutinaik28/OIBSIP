# SQL Injection Notes

## Environment

- Application: DVWA (Damn Vulnerable Web Application)
- Security Level: Low
- Platform: Kali Linux
- Module: SQL Injection
- Target: Local DVWA installation

## Test 1

### Payload

' OR '1'='1

### Result

The application returned multiple user records instead of returning only one matching user.

The displayed records included:

- admin
- Gordon Brown
- Hack Me
- Pablo Picasso
- Bob Smith

### Analysis

The payload changes the SQL condition so that the condition evaluates as true. Because the DVWA Low-security SQL Injection page directly uses the user input in the SQL query, the application returns multiple database records.

Evidence:

- `sql_injection_1.png`
- Test 1 video recording

---

## Test 2

### Payload

1' OR '1'='1' #

### Result

The application again returned multiple user records, including:

- admin
- Gordon Brown
- Hack Me
- Pablo Picasso
- Bob Smith

### Analysis

This payload adds a true condition and uses `#` as a SQL comment marker. The comment causes the remaining part of the original SQL statement to be ignored, allowing the injected condition to affect the query.

Evidence:

- `sql_injection_2.png`
- Test 2 video recording

---

## Vulnerability Explanation

SQL Injection occurs when an application places untrusted user input directly into an SQL query without safely separating data from SQL commands.

In this DVWA demonstration, the Low security setting intentionally contains this vulnerability.

## Prevention

Developers should use:

1. Parameterized queries / prepared statements
2. Proper input validation
3. Least-privilege database accounts
4. Safe database APIs
5. Avoiding direct concatenation of user input into SQL queries
