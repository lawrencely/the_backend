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

lebron = User.create(name: 'lebron james', email: 'lebronjames@jameslebron.com', password: 'lebronjames', options: '')

store = Store.create(user_id: 0, name: 'General Pants Co.', description: 'General Pants Co. is an Australian fashion retailer operating across NSW, VIC, QLD, SA and WA that sells both international and national brands. The retailer specialises in streetwear, denim, skate clothing and surfwear.', api_key: '', api_secret: '')

store1 = Store.create(user_id: 0, name: 'store1', description: 'store 1', api_key: '', api_secret: '')
store2 = Store.create(user_id: 0, name: 'store2', description: 'store 2', api_key: '', api_secret: '')
store3 = Store.create(user_id: 0, name: 'store3', description: 'store 3', api_key: '', api_secret: '')

customer = Customer.create(name: 'Lawrence', email: 'customer@email.com', password_digest: 'customer', store_id: 0, street: '1 customer st', suburb: 'customer suburb', postcode: '1234', state: 'NSW', country: 'Australia')
customer1 = Customer.create(name: 'James', email: 'customer@email.com', password_digest: 'customer', store_id: 0, street: '1 customer st', suburb: 'customer suburb', postcode: '1234', state: 'NSW', country: 'Australia')
customer2 = Customer.create(name: 'Joel', email: 'customer@email.com', password_digest: 'customer', store_id: 0, street: '1 customer st', suburb: 'customer suburb', postcode: '1234', state: 'NSW', country: 'Australia')
customer3 = Customer.create(name: 'Andrew', email: 'customer@email.com', password_digest: 'customer', store_id: 0, street: '1 customer st', suburb: 'customer suburb', postcode: '1234', state: 'NSW', country: 'Australia')
customer4 = Customer.create(name: 'Rusli', email: 'customer@email.com', password_digest: 'customer', store_id: 0, street: '1 customer st', suburb: 'customer suburb', postcode: '1234', state: 'NSW', country: 'Australia')
customer5 = Customer.create(name: 'Tanya', email: 'customer@email.com', password_digest: 'customer', store_id: 0, street: '1 customer st', suburb: 'customer suburb', postcode: '1234', state: 'NSW', country: 'Australia')
customer6 = Customer.create(name: 'Jacqui', email: 'customer@email.com', password_digest: 'customer', store_id: 0, street: '1 customer st', suburb: 'customer suburb', postcode: '1234', state: 'NSW', country: 'Australia')
customer7 = Customer.create(name: 'Angela', email: 'customer@email.com', password_digest: 'customer', store_id: 0, street: '1 customer st', suburb: 'customer suburb', postcode: '1234', state: 'NSW', country: 'Australia')


order = Order.create(customer_id: 0, status: 'pending', memo: 'none', store_id: 0, street: '1 customer st', suburb: 'customer suburb', postcode: '1234', state: 'NSW', country: 'Australia', ip_address: 'none')
order1 = Order.create(customer_id: 0, status: 'pending', memo: 'none', store_id: 0, street: '1 customer st', suburb: 'customer suburb', postcode: '1234', state: 'NSW', country: 'Australia', ip_address: 'none')
order2 = Order.create(customer_id: 0, status: 'pending', memo: 'none', store_id: 0, street: '1 customer st', suburb: 'customer suburb', postcode: '1234', state: 'NSW', country: 'Australia', ip_address: 'none')
order3 = Order.create(customer_id: 0, status: 'pending', memo: 'none', store_id: 0, street: '1 customer st', suburb: 'customer suburb', postcode: '1234', state: 'NSW', country: 'Australia', ip_address: 'none')
order4 = Order.create(customer_id: 0, status: 'pending', memo: 'none', store_id: 0, street: '1 customer st', suburb: 'customer suburb', postcode: '1234', state: 'NSW', country: 'Australia', ip_address: 'none')
order5 = Order.create(customer_id: 0, status: 'pending', memo: 'none', store_id: 0, street: '1 customer st', suburb: 'customer suburb', postcode: '1234', state: 'NSW', country: 'Australia', ip_address: 'none')
order6 = Order.create(customer_id: 0, status: 'pending', memo: 'none', store_id: 0, street: '1 customer st', suburb: 'customer suburb', postcode: '1234', state: 'NSW', country: 'Australia', ip_address: 'none')
order7 = Order.create(customer_id: 0, status: 'pending', memo: 'none', store_id: 0, street: '1 customer st', suburb: 'customer suburb', postcode: '1234', state: 'NSW', country: 'Australia', ip_address: 'none')
order8 = Order.create(customer_id: 0, status: 'pending', memo: 'none', store_id: 0, street: '1 customer st', suburb: 'customer suburb', postcode: '1234', state: 'NSW', country: 'Australia', ip_address: 'none')
order9 = Order.create(customer_id: 0, status: 'pending', memo: 'none', store_id: 0, street: '1 customer st', suburb: 'customer suburb', postcode: '1234', state: 'NSW', country: 'Australia', ip_address: 'none')
order10 = Order.create(customer_id: 0, status: 'pending', memo: 'none', store_id: 0, street: '1 customer st', suburb: 'customer suburb', postcode: '1234', state: 'NSW', country: 'Australia', ip_address: 'none')
order11 = Order.create(customer_id: 0, status: 'pending', memo: 'none', store_id: 0, street: '1 customer st', suburb: 'customer suburb', postcode: '1234', state: 'NSW', country: 'Australia', ip_address: 'none')

category = Category.create(name: 'Shirts', description: 'Shirt brands go here', store_id: 0)
category1 = Category.create(name: 'Jeans', description: 'Jean brands go here', store_id: 0)
category2 = Category.create(name: 'Jackets', description: 'Jacket brands go here', store_id: 0)
category3 = Category.create(name: 'hats', description: 'Hat brand goes here', store_id: 0)

product = Product.create(name: 'T-Shirt', description: 'product_description', short_description: 'short_description', price: '20', product_attributes: '', image: '', store_id: 0)
product1 = Product.create(name: 'V-Neck', description: 'product_description', short_description: 'short_description', price: '50', product_attributes: '', image: '', store_id: 0)
product2 = Product.create(name: 'Scoop Neck', description: 'product_description', short_description: 'short_description', price: '30', product_attributes: '', image: '', store_id: 0)
product3 = Product.create(name: 'Nudie Jeans', description: 'product_description', short_description: 'short_description', price: '60', product_attributes: '', image: '', store_id: 0)
product4 = Product.create(name: 'Cheap Monday Jeans', description: 'product_description', short_description: 'short_description', price: '18', product_attributes: '', image: '', store_id: 0)
product5 = Product.create(name: 'Hipster Hat', description: 'product_description', short_description: 'short_description', price: '25', product_attributes: '', image: '', store_id: 0)
product6 = Product.create(name: 'Overcoat', description: 'product_description', short_description: 'short_description', price: '33', product_attributes: '', image: '', store_id: 0)
product7 = Product.create(name: 'Cool Jacket', description: 'product_description', short_description: 'short_description', price: '64', product_attributes: '', image: '', store_id: 0)
product8 = Product.create(name: 'Sunflower Hat', description: 'product_description', short_description: 'short_description', price: '12', product_attributes: '', image: '', store_id: 0)
product9 = Product.create(name: 'Black Jeans', description: 'product_description', short_description: 'short_description', price: '93', product_attributes: '', image: '', store_id: 0)
product10 = Product.create(name: 'Big Jacket', description: 'product_description', short_description: 'short_description', price: '99', product_attributes: '', image: '', store_id: 0)
product11 = Product.create(name: 'Skinny Jeans', description: 'product_description', short_description: 'short_description', price: '150', product_attributes: '', image: '', store_id: 0)

store.user_id = lebron.id

customer.store_id = store.id
customer1.store_id = store.id
customer2.store_id = store.id
customer3.store_id = store.id
customer4.store_id = store.id
customer5.store_id = store.id
customer6.store_id = store.id
customer7.store_id = store.id


category.store_id = store.id
category1.store_id = store.id
category2.store_id = store.id
category3.store_id = store.id

order.customer_id = customer1.id
order1.customer_id = customer1.id
order2.customer_id = customer2.id
order3.customer_id = customer2.id
order4.customer_id = customer2.id
order5.customer_id = customer6.id
order6.customer_id = customer6.id
order7.customer_id = customer6.id
order8.customer_id = customer5.id
order9.customer_id = customer5.id
order10.customer_id = customer5.id
order11.customer_id = customer3.id

order.store_id = store.id
order1.store_id = store.id
order2.store_id = store.id
order3.store_id = store.id
order4.store_id = store.id
order5.store_id = store.id
order6.store_id = store.id
order7.store_id = store.id
order8.store_id = store.id
order9.store_id = store.id
order10.store_id = store.id
order11.store_id = store.id


product.store_id = store.id
product1.store_id = store.id
product2.store_id = store.id
product3.store_id = store.id
product4.store_id = store.id
product5.store_id = store.id
product6.store_id = store.id
product7.store_id = store.id
product8.store_id = store.id
product9.store_id = store.id
product10.store_id = store.id
product11.store_id = store.id

#category shirts
category.products << product
category.products << product1
category.products << product2
# category1 Jeans
category1.products << product3
category1.products << product4
category1.products << product9
category1.products << product11

# category2 jackets
category2.products << product6
category2.products << product7
category2.products << product10
# category3 hats
category3.products << product5
category3.products << product8

lebron.save

store.save
store1.save
store2.save
store3.save

customer.save
customer1.save
customer2.save
customer3.save
customer4.save
customer5.save
customer6.save
customer7.save

category.save
category1.save
category2.save
category3.save

product.save
product1.save
product2.save
product3.save
product4.save
product5.save
product6.save
product7.save
product8.save
product9.save
product10.save
product11.save

order.save
order1.save
order2.save
order3.save
order4.save
order5.save
order6.save
order7.save
order8.save
order9.save
order10.save
order11.save

category.save
category1.save
category2.save
category3.save






























