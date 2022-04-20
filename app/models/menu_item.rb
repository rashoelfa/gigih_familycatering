class MenuItem < ApplicationRecord
  has_many :item_categories
  has_many :order_details
  validates :name, presence: true, uniqueness: true, length: { maximum: 150, too_long: "150 characters is the maximum allowed" }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0.01 }
end
