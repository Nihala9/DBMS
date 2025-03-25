OPTIMIZING DATABASE: (JOINS)
/*1.     List the product name and quantity of invoice items.*/

mysql> SELECT Product.pname,Invoice_item.quantity FROM Product JOIN Invoice_item
 ON Product.pid=Invoice_item.pid;
+--------+----------+
| pname  | quantity |
+--------+----------+
| Pen    |        5 |
| Pencil |        2 |
| Pencil |        3 |
| Soap   |        4 |
+--------+----------+
4 rows in set (0.00 sec)


/*2.    Display invoice details of the transaction dated ’11-03-2024’.*/

mysql> SELECT * FROM Invoice_master JOIN Invoice_item ON Invoice_master.inv_id=Invoice_item.inv_id WHERE inv_date='2024-03-11';
+--------+---------+------------+--------+------+----------+
| inv_id | cust_id | inv_date   | inv_id | pid  | quantity |
+--------+---------+------------+--------+------+----------+
|    102 |   10002 | 2024-03-11 |    102 |    2 |        3 |
+--------+---------+------------+--------+------+----------+
1 row in set (0.00 sec)


/*3.    Display the customer name, product name, invoice date of purchased item ‘pen’.*/

mysql> SELECT name,pname,inv_date FROM Customer JOIN Invoice_master ON Customer.id=Invoice_master.cust_id JOIN Invoice_item ON Invoice_master.inv_id=Invoice_item.inv_id JOIN Product ON Product.pid=Invoice_item.pid WHERE pname='pen';
+-------+-------+------------+
| name  | pname | inv_date   |
+-------+-------+------------+
| Rahul | Pen   | 2024-03-10 |
+-------+-------+------------+
1 row in set (0.00 sec)


/*4.    Display all customer details and invoice details must include customer has not purchased items.*/

mysql> SELECT * FROM Customer LEFT JOIN Invoice_master ON Invoice_master.cust_id=Customer.id;
+-------+--------+------------+------+------------+--------+---------+------------+
| id    | name   | address    | city | ph_no      | inv_id | cust_id | inv_date   |
+-------+--------+------------+------+------------+--------+---------+------------+
| 10001 | Rahul  | 123 Street | Clt  | NULL       |    101 |   10001 | 2024-03-10 |
| 10002 | Aisha  | 456 Avenue | Ekm  | 9876543210 |    102 |   10002 | 2024-03-11 |
| 10004 | Neha   | 101 Main   | Knr  | 9988776655 |   NULL |    NULL | NULL       |
| 10007 | Arya   | Harihar    | Knr  | 3548747284 |   NULL |    NULL | NULL       |
+-------+--------+------------+------+------------+--------+---------+------------+
4 rows in set (0.00 sec)

  
*********************************************************************************************************************************************

/*OPTIMIZING DATABASE: (Using Set, arithmetic, logical and special operators)

1.        Display customer_id, city  who lives either in ‘CLT’ or in ‘TVM’*/

mysql> SELECT id,city FROM Customer WHERE city='Tvm' OR city='Clt';
+-------+------+
| id    | city |
+-------+------+
| 10001 | Clt  |
| 10003 | Tvm  |
+-------+------+
2 rows in set (0.00 sec)

  
/*2.       Display product details with an updated price amount(new price= old price+5rs)*/

mysql> SELECT pname,price,price+5 AS Updated_price FROM Product;
+----------+--------+---------------+
| pname    | price  | Updated_price |
+----------+--------+---------------+
| Pen      | 120.00 |        125.00 |
| Pencil   |  75.00 |         80.00 |
| Eraser   |  50.00 |         55.00 |
+----------+--------+---------------+
3 rows in set (0.00 sec)


/*3.    Display customer details who doesn’t have phone number and lives in ‘Calicut’ city (use logical operators)*/

mysql> SELECT * FROM Customer WHERE ph_no IS NULL AND city='Clt';
+-------+-------+------------+------+-------+
| id    | name  | address    | city | ph_no |
+-------+-------+------------+------+-------+
| 10001 | Rahul | 123 Street | Clt  | NULL  |
+-------+-------+------------+------+-------+
1 row in set (0.00 sec)


/*4.    List the product names if it finds any records in the invoice items table has quantity =3 (use special operators)*/

mysql>  SELECT pname FROM Product WHERE EXISTS(SELECT 1 FROM Invoice_item WHERE
Invoice_item.pid = Product.pid AND quantity=2);
+--------+
| pname  |
+--------+
| Pencil |
+--------+
1 row in set (0.00 sec)
