/*1.      Write a MongoDB query to display the customer documents having city ‘ekm’,’tvm’.*/

INVOICE> db.Customer.find({ "address.city": {$in: ["Ekm","Tvm"] } })
[
  {
    _id: ObjectId('67fe2ed045bd0a85f9544ca7'),
    cust_id: 1,
    name: 'Arun',
    address: { street: '1 Main St', city: 'Tvm', zip: '682001' },
    phone: 9988776655
  }
]


/*2.     Write a MongoDB query to display all product documents their price >50.*/

INVOICE> db.Product.find({ price: {$gt: 50} })
[
  {
    _id: ObjectId('67fe2fe645bd0a85f9544ca9'),
    cust_id: 102,
    name: 'Laptop',
    price: 45000,
    stock: 15
  },
  {
    _id: ObjectId('67fe303745bd0a85f9544cab'),
    prod_id: 101,
    name: 'Mouse',
    price: 800,
    stock: 50
  }
]


/* 3.    Write a MongoDB query to find customer documents who not live in ‘tvm’.*/

INVOICE> db.Customer.find({ "address.city": { $ne: "Tvm" } })
[
  {
    _id: ObjectId('67fe2ad677450369d9d861e4'),
    customer_id: 'CUST003',
    name: 'Chandra Mohan',
    address: { street: '3 Beach Road', city: 'Kollam', zip: '691001' },
    phone: '9555666777'
  }
]


//VERIFIED
