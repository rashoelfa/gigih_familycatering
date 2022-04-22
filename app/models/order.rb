class Order < ApplicationRecord
  has_many :order_details

  def self.update_status(order_id)
    query = "UPDATE orders
            SET status=\"PAID\"
            WHERE id=#{order_id};"
    result = ActiveRecord::Base.connection.execute(query)
    return result
  end

  def self.update_cancelled_status(order_id)
    query = "UPDATE orders
            SET status=\"CANCELLED\"
            WHERE status=\"NEW\";"
    result = ActiveRecord::Base.connection.execute(query)
    return result
  end

  def self.update_price(order_id,price)
    query = "UPDATE orders
            SET total=#{price}
            WHERE id=#{order_id};"
    result = ActiveRecord::Base.connection.execute(query)
    return result
  end
  
  def self.show_today_order
    query = "select order_details.order_id, orders.order_date, customers.name, customers.email, orders.total, GROUP_CONCAT(menu_items.name) as items, orders.status,orders.created_at
from orders
join order_details on orders.id = order_details.order_id
join customers on orders.customer_id = customers.id
join menu_items on order_details.menu_item_id = menu_items.id
group by order_details.order_id
    having orders.order_date = \"#{Date.today}\" ;"
    result = ActiveRecord::Base.connection.execute(query)
    return result
  end
end
