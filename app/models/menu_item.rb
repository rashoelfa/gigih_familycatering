class MenuItem < ApplicationRecord
  has_many :item_categories
  has_many :order_details
  validates :name, presence: true, uniqueness: true, length: { maximum: 150, too_long: "150 characters is the maximum allowed" }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0.01 }

  def self.show_all
    query = "select menu_items.*, GROUP_CONCAT(categories.name) as category
    from menu_items
    join item_categories on item_categories.menu_item_id = menu_items.id
    join categories on categories.id = item_categories.category_id
    group by item_categories.menu_item_id;"
    results = ActiveRecord::Base.connection.execute(query)
    return results
  end
end
