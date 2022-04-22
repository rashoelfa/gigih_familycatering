class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :menu_item

  def self.get_item_price(item_id)
    query = "select menu_items.price
    from order_details
    join menu_items on menu_items.id = order_details.menu_item_id
    where menu_items.id = #{item_id}"
    
    result = ActiveRecord::Base.connection.execute(query)
    return result
  end
end
