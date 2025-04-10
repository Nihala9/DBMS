/* 1.     Write a PL/SQL program to create a name list of customers using CURSOR */

mysql> DELIMITER //
mysql> CREATE PROCEDURE ListCustomerNames() 
    -> BEGIN
    -> DECLARE done INT DEFAULT FALSE;
    -> DECLARE CustomerName VARCHAR(20);
    -> DECLARE custCursor CURSOR FOR
    -> SELECT name
    -> FROM Customer;
    -> DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    -> OPEN custCursor;
    -> read_loop: LOOP
    -> FETCH custCursor INTO CustomerName;
    -> IF done THEN
    -> LEAVE read_loop;
    -> END IF;
    -> SELECT CustomerName AS 'Customer Name';
    -> END LOOP read_loop;
    -> CLOSE custCursor;
    -> END //
Query OK, 0 rows affected (0.00 sec)

mysql> DELIMITER ;
mysql> CALL ListCustomerNames();
+---------------+
| Customer Name |
+---------------+
| Rahul         |
+---------------+
1 row in set (0.00 sec)

+---------------+
| Customer Name |
+---------------+
| Aisha         |
+---------------+
1 row in set (0.00 sec)

+---------------+
| Customer Name |
+---------------+
| Vikram        |
+---------------+
1 row in set (0.00 sec)

+---------------+
| Customer Name |
+---------------+
| Neha          |
+---------------+
1 row in set (0.00 sec)

+---------------+
| Customer Name |
+---------------+
| Suresh        |
+---------------+
1 row in set (0.00 sec)

+---------------+
| Customer Name |
+---------------+
| Meera         |
+---------------+
1 row in set (0.00 sec)

+---------------+
| Customer Name |
+---------------+
| Arya          |
+---------------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)
//VERIFIED
