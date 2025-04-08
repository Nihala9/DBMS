/* 1.      Create a trigger to handle updates to the customer table. */

mysql> CREATE TABLE cust(id int,name varchar(10),city varchar(10),phno int) //
Query OK, 0 rows affected (0.01 sec)

mysql> DELIMITER $
mysql> CREATE TRIGGER c_upd
    -> AFTER UPDATE ON Customer 
    -> FOR EACH ROW BEGIN 
    -> INSERT INTO cust SET id=new.id,name=new.name,city=new.city,phno=new.phno;
    -> END $
Query OK, 0 rows affected (0.20 sec)

mysql> SELECT * FROM Customer //
+-------+--------+------------+------+------------+
| id    | name   | address    | city | ph_no      |
+-------+--------+------------+------+------------+
| 10001 | Rahul  | 123 Street | Clt  | NULL       |
| 10002 | Aisha  | 456 Avenue | Ekm  | 9876543210 |
| 10003 | Vikram | 789 Road   | Tvm  | NULL       |
| 10004 | Neha   | 101 Main   | Knr  | 9988776655 |
+-------+--------+------------+------+------------+
4 rows in set (0.00 sec)

mysql> UPDATE Customer set city='Clt' WHERE id=10004 //
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM cust //
+-------+------+------+------------+
| id    | name | city | phno       |
+-------+------+------+------------+
| 10004 | Neha | Clt  | 9988776655 |
+-------+------+------+------------+
1 row in set (0.00 sec)


/*   2. Create a trigger to handle inserts to the product relation ( if price < 5 the set price to 10). */

mysql> CREATE TRIGGER p_ins
    -> BEFORE INSERT ON Product
    -> FOR EACH ROW BEGIN
    -> IF new.price <5 THEN
    -> SET new.PRICE=10;
    -> END IF; 
    -> END //
Query OK, 0 rows affected (0.01 sec)

mysql> INSERT INTO Product VALUES(4,'Eraser',4) //
Query OK, 1 row affected (0.00 sec)

mysql> SELECT * FROM Product //
+-----+----------+--------+
| pid | pname    | price  |
+-----+----------+--------+
|   1 | Pen      | 120.00 |
|   2 | Pencil   |  75.00 |
|   3 | Soap     |  60.00 |
|   4 | Eraser   |  10.00 |
+-----+----------+--------+
4 rows in set (0.00 sec)
//VERIFIED
