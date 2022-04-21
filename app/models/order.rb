class Order < ApplicationRecord
  has_many :order_details
  
  def self.show_customer_order
    query = "select order_details.order_id, orders.order_date, customers.name, customers.email, orders.total, GROUP_CONCAT(menu_items.name) as items, orders.status
from orders
join order_details on orders.id = order_details.order_id
join customers on orders.customer_id = customers.id
join menu_items on order_details.menu_item_id = menu_items.id
group by order_details.order_id;"
    results = ActiveRecord::Base.connection.execute(query)
    return results
  end
end
