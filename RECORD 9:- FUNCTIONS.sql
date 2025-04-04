/*  1. Create a function to calculate price_range(low, medium, high) of each product. If price<=5 indicate as low, upto 50 indicate as medium, and above as high.*/

mysql> CREATE FUNCTION price_range(price INT)
    -> RETURNS VARCHAR(10)
    -> DETERMINISTIC
    -> BEGIN
    ->    DECLARE msg VARCHAR(10);
    ->    IF price <= 5 THEN
    ->       SET msg = 'Low';
    ->    ELSEIF price <= 50 THEN
    ->       SET msg = 'Medium';
    ->    ELSE
    ->       SET msg = 'High';
    ->    END IF;
    ->    RETURN(msg);
    -> END//
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT * FROM Product//
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

mysql> SELECT pname,price_range(price) FROM Product//
+----------+--------------------+
| pname    | price_range(price) |
+----------+--------------------+
| Pen      | High               |
| Pencil   | High               |
| Soap     | High               |
| Notebook | High               |
| Eraser   | Medium             |
+----------+--------------------+
5 rows in set (0.00 sec)
//VERIFIED
