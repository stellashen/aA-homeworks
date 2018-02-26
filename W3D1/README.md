## Creating the DB (After PostgreSQL Setup)

```
~$ psql
psql (10.2)
Type "help" for help.

sheny=# CREATE DATABASE bank;
CREATE DATABASE
sheny=# \q
~$ psql bank
psql (10.2)
Type "help" for help.

bank=# \d
Did not find any relations.
```

\d is a Postgres command to list the tables

Run the import script,
get data from the `learning-sql-example-postgres.sql` file,
and pipe them in to `qsql bank`:

```
~$ cd Downloads
~/Downloads$ cat learning-sql-example-postgres.sql | psql bank
CREATE TABLE
CREATE TABLE
CREATE TABLE
CREATE TABLE
CREATE TABLE
CREATE TYPE
CREATE TABLE
CREATE TABLE
CREATE TABLE
CREATE TABLE
CREATE TYPE
CREATE TABLE
CREATE TYPE
CREATE TABLE
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
SELECT 18
UPDATE 2
UPDATE 1
UPDATE 5
UPDATE 3
UPDATE 2
UPDATE 2
UPDATE 2
DROP TABLE
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 3
INSERT 0 2
INSERT 0 2
INSERT 0 3
INSERT 0 1
INSERT 0 2
INSERT 0 1
INSERT 0 2
INSERT 0 3
INSERT 0 2
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 21
~/Downloads$ cd ..
~$ psql bank
psql (10.2)
Type "help" for help.

bank=# \d
                 List of relations
 Schema |          Name          |   Type   | Owner
--------+------------------------+----------+-------
 public | account                | table    | sheny
 public | account_account_id_seq | sequence | sheny
 public | branch                 | table    | sheny
 public | branch_branch_id_seq   | sequence | sheny
 public | business               | table    | sheny
 public | customer               | table    | sheny
 public | customer_cust_id_seq   | sequence | sheny
 public | department             | table    | sheny
 public | department_dept_id_seq | sequence | sheny
 public | employee               | table    | sheny
 public | employee_emp_id_seq    | sequence | sheny
 public | individual             | table    | sheny
 public | officer                | table    | sheny
 public | officer_officer_id_seq | sequence | sheny
 public | product                | table    | sheny
 public | product_type           | table    | sheny
 public | transaction            | table    | sheny
 public | transaction_txn_id_seq | sequence | sheny
(18 rows)

bank=# SELECT * FROM customer LIMIT 2;
 cust_id |   fed_id    | cust_type_cd |       address       |   city    | state | postal_code
---------+-------------+--------------+---------------------+-----------+-------+-------------
       1 | 111-11-1111 | I            | 47 Mockingbird Ln   | Lynnfield | MA    | 01940
       2 | 222-22-2222 | I            | 372 Clearwater Blvd | Woburn    | MA    | 01801
(2 rows)
```
