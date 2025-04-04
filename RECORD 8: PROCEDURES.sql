/* PL/SQL PROGRAMS- STORED PROCEDURES

1.      Create a procedure to display all tables in the invoice database.*/

mysql> DELIMITER //
mysql> USE INVOICE //
Database changed
mysql> CREATE PROCEDURE Invoice()
    -> BEGIN
    -> SELECT * FROM Customer;
    -> SELECT * FROM Product;
    -> SELECT * FROM Invoice_item;
    -> SELECT * FROM Invoice_master;
    -> END //
Query OK, 0 rows affected (0.01 sec)

mysql> CALL Invoice //
+-------+--------+------------+------+------------+
| id    | name   | address    | city | ph_no      |
+-------+--------+------------+------+------------+
| 10001 | Rahul  | 123 Street | Clt  | NULL       |
| 10002 | Aisha  | 456 Avenue | Ekm  | 9876543210 |
| 10003 | Vikram | 789 Road   | Tvm  | NULL       |
| 10004 | Neha   | 101 Main   | Knr  | 9988776655 |
| 10005 | Suresh | 202 Market | Ktym | 9845612345 |
| 10006 | Meera  | Agre       | Knr  | 6355638373 |
| 10007 | Arya   | Harihar    | Knr  | 3548747284 |
+-------+--------+------------+------+------------+
7 rows in set (0.00 sec)

+-----+----------+--------+
| pid | pname    | price  |
+-----+----------+--------+
|   1 | Pen      | 120.00 |
|   2 | Pencil   |  75.00 |
|   3 | Soap     |  60.00 |
|   4 | Notebook |  80.00 |
|   5 | Eraser   |  50.00 |
+-----+----------+--------+
5 rows in set (0.00 sec)

+--------+------+----------+
| inv_id | pid  | quantity |
+--------+------+----------+
|    101 |    1 |        5 |
|    102 |    2 |        3 |
|    103 |    3 |        4 |
|    101 |    2 |        2 |
+--------+------+----------+
4 rows in set (0.00 sec)

+--------+---------+------------+
| inv_id | cust_id | inv_date   |
+--------+---------+------------+
|    101 |   10001 | 2024-03-10 |
|    102 |   10002 | 2024-03-11 |
|    103 |   10003 | 2024-03-12 |
+--------+---------+------------+
3 rows in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)


/* 2.      Create a procedure to find greatest of 2 numbers. */

mysql> CREATE PROCEDURE Greater(a INT, b INT)
    -> BEGIN
    -> IF a > b THEN SELECT a AS greater;
    -> ELSE SELECT b AS greater;
    -> END IF;
    -> END //
Query OK, 0 rows affected (0.00 sec)

mysql> CALL Greater(10,20) //
+---------+
| greater |
+---------+
|      20 |
+---------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)


/* 3.      Create a procedure to display invoice details of a particular customer.*/

mysql> CREATE PROCEDURE inv_detail(N VARCHAR(20)) BEGIN SELECT Customer.name,Invoice_master.inv_id,Invoice_master.cust_id,Invoice_master.inv_date,Product.pname,Invoice_item.pid,Invoice_item.quantity FROM Invoice_item JOIN Invoice_master ON Invoice_master.inv_id=Invoice_item.inv_id JOIN Product ON Product.pid=Invoice_item.pid JOIN Customer ON Customer.id=Invoice_master.cust_id WHERE Customer.name=N; END//
Query OK, 0 rows affected (0.00 sec)

mysql> CALL inv_detail('Aisha')//
+-------+--------+---------+------------+--------+------+----------+
| name  | inv_id | cust_id | inv_date   | pname  | pid  | quantity |
+-------+--------+---------+------------+--------+------+----------+
| Aisha |    102 |   10002 | 2024-03-11 | Pencil |    2 |        3 |
+-------+--------+---------+------------+--------+------+----------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)
//VERIFIED
