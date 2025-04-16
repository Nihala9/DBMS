/*1.   Write a MongoDB query to create an INVOICE database and collections (CUSTOMER, PRODUCT) and its corresponding documents.*/

test> use INVOICE
switched to db INVOICE
INVOICE> db.Customer.insertOne({
... cust_id:001,
... name:"Arun",
... address: {street: "1 Main St",city: "Kochi",zip: "682001" },
... phone: 9988776655
... })
{
  acknowledged: true,
  insertedId: ObjectId('67fe2ed045bd0a85f9544ca7')
}
INVOICE> db.Customer.insertOne({ 
... cust_id: 002,
... name: "Bina", 
... address: { street: "2 Market Rd", city: "Clt", zip: "673001" }, 
... phone: 9112233445 
... })
{
  acknowledged: true,
  insertedId: ObjectId('67fe2f4c45bd0a85f9544ca8')
}

INVOICE> db.Product.insertOne({ 
... prod_id: 102,
... name: "Laptop",
... price: 45000, 
... stock: 15
... })
{
  acknowledged: true,
  insertedId: ObjectId('67fe2fe645bd0a85f9544ca9')
}

INVOICE> db.Product.insertOne({
... prod_id: 101,
... name: "Mouse",
... price: 800, 
... stock: 50
... })
{
  acknowledged: true,
  insertedId: ObjectId('67fe303745bd0a85f9544cab')
}


/*2.  Write a MongoDB query to find all documents from the collection CUSTOMER*/

INVOICE> db.Customer.find({})
[
  {
    _id: ObjectId('67fe2ed045bd0a85f9544ca7'),
    cust_id: 1,
    name: 'Arun',
    address: { street: '1 Main St', city: 'Kochi', zip: '682001' },
    phone: 9988776655
  },
  {
    _id: ObjectId('67fe2f4c45bd0a85f9544ca8'),
    cust_id: 2,
    name: 'Bina',
    address: { street: '2 Market Rd', city: 'Clt', zip: '673001' },
    phone: 9112233445
  }
]


/* 3. Write a MongoDB query to update the city in the collection CUSTOMER.*/

INVOICE> db.Customer.updateOne(
... { cust_id: 1 },
... { $set: {"address.city": "Tvm" } }
... )
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}


/*4.   Write a MongoDB query to delete the first matched document whose city is “Calicut”. */

INVOICE> db.Customer.deleteOne({ "address.city":"Clt" })
{ acknowledged: true, deletedCount: 1 }
//VERIFIED
