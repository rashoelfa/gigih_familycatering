class ItemCategory < ApplicationRecord
  belongs_to :menu_item
  belongs_to :category
end
