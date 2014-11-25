# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Store.destroy_all
User.destroy_all
Customer.destroy_all
Order.destroy_all
Product.destroy_all
Category.destroy_all

james = User.create(name: 'james lebron', email: 'jameslebron@jameslebron.com', password: 'jameslebron', options: '')
james1 = User.create(name: 'james lebron1', email: 'jameslebron@jameslebron.com', password: 'jameslebron', options: '')
james2 = User.create(name: 'james lebron2', email: 'jameslebron@jameslebron.com', password: 'jameslebron', options: '')
james3 = User.create(name: 'james lebron3', email: 'jameslebron@jameslebron.com', password: 'jameslebron', options: '')

store = Store.create(user_id: 0, name: 'store', description: 'store ', api_key: '', api_secret: '')
store1 = Store.create(user_id: 0, name: 'store1', description: 'store 1', api_key: '', api_secret: '')
store2 = Store.create(user_id: 0, name: 'store2', description: 'store 2', api_key: '', api_secret: '')
store3 = Store.create(user_id: 0, name: 'store3', description: 'store 3', api_key: '', api_secret: '')

customer = Customer.create(name: 'customer', email: 'customer@email.com', password_digest: 'customer', store_id: 0, street: '1 customer st', suburb: 'customer suburb', postcode: '1234', state: 'NSW', country: 'Australia')
customer1 = Customer.create(name: 'customer1', email: 'customer@email.com', password_digest: 'customer', store_id: 0, street: '1 customer st', suburb: 'customer suburb', postcode: '1234', state: 'NSW', country: 'Australia')
customer2 = Customer.create(name: 'customer2', email: 'customer@email.com', password_digest: 'customer', store_id: 0, street: '1 customer st', suburb: 'customer suburb', postcode: '1234', state: 'NSW', country: 'Australia')
customer3 = Customer.create(name: 'customer3', email: 'customer@email.com', password_digest: 'customer', store_id: 0, street: '1 customer st', suburb: 'customer suburb', postcode: '1234', state: 'NSW', country: 'Australia')

order = Order.create(customer_id: 0, status: 'pending', memo: 'none', store_id: 0, street: '1 customer st', suburb: 'customer suburb', postcode: '1234', state: 'NSW', country: 'Australia', ip_address: 'none')
order1 = Order.create(customer_id: 0, status: 'pending', memo: 'none', store_id: 0, street: '1 customer st', suburb: 'customer suburb', postcode: '1234', state: 'NSW', country: 'Australia', ip_address: 'none')
order2 = Order.create(customer_id: 0, status: 'pending', memo: 'none', store_id: 0, street: '1 customer st', suburb: 'customer suburb', postcode: '1234', state: 'NSW', country: 'Australia', ip_address: 'none')
order3 = Order.create(customer_id: 0, status: 'pending', memo: 'none', store_id: 0, street: '1 customer st', suburb: 'customer suburb', postcode: '1234', state: 'NSW', country: 'Australia', ip_address: 'none')

category = Category.create(name: 'category', description: 'category_description', store_id: 0)
category1 = Category.create(name: 'category1', description: 'category_description', store_id: 0)
category2 = Category.create(name: 'category2', description: 'category_description', store_id: 0)
category3 = Category.create(name: 'category3', description: 'category_description', store_id: 0)

product = Product.create(name: 'product', description: 'product_description', short_description: 'short_description', price: '123', product_attributes: '', image: '', store_id: 0)
product1 = Product.create(name: 'product1', description: 'product_description', short_description: 'short_description', price: '123', product_attributes: '', image: '', store_id: 0)
product2 = Product.create(name: 'product2', description: 'product_description', short_description: 'short_description', price: '123', product_attributes: '', image: '', store_id: 0)
product3 = Product.create(name: 'product3', description: 'product_description', short_description: 'short_description', price: '123', product_attributes: '', image: '', store_id: 0)

store.user_id = james.id
store1.user_id = james1.id
store2.user_id = james2.id
store3.user_id = james3.id

customer.store_id = store.id
customer1.store_id = store1.id
customer2.store_id = store2.id
customer3.store_id = store3.id

category.store_id = store.id
category1.store_id = store1.id
category2.store_id = store2.id
category3.store_id = store3.id

order.customer_id = customer.id
order1.customer_id = customer1.id
order2.customer_id = customer2.id
order3.customer_id = customer3.id

order.store_id = store.id
order1.store_id = store.id
order2.store_id = store.id
order3.store_id = store.id

product.store_id = store.id
product1.store_id = store1.id
product2.store_id = store2.id
product3.store_id = store3.id


james.save
james1.save
james2.save
james3.save

store.save
store1.save
store2.save
store3.save

customer.save
customer1.save
customer2.save
customer3.save

category.save
category1.save
category2.save
category3.save

product.save
product1.save
product2.save
product3.save

order.save
order1.save
order2.save
order3.save


































