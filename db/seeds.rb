# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Category.create(
  name: 'Makanan'
)
Category.create(
  name: 'Minuman'
)
Category.create(
  name: 'Asia'
)

Customer.create(
  name: 'Mary Jones',
  email: 'maryjones@gmail.com'
)

MenuItem.create(
  name: 'Cordon Bleu',
  price: 26000.0
)
MenuItem.create(
  name: 'Spaghetti',
  price: 30000.0
)

ItemCategory.create(
  menu_item_id: 1,
  category_id: 2
)

ItemCategory.create(
  menu_item_id: 1,
  category_id: 3
)

Order.create(
  customer_id: 1,
  total: 58000.0,
  order_date: "2022-04-21T23:42:09Z",
  status: 'NEW'
)

OrderDetail.create(
  order_id: 1,
  menu_item_id: 1,
  quantity: 1,
)

OrderDetail.create(
  order_id: 1,
  menu_item_id: 2,
  quantity: 1,
)
