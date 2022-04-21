class CreateOrderDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :order_details do |t|
      t.belongs_to :order, foreign_key: true
      t.belongs_to :menu_item, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
