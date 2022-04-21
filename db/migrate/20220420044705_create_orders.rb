class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.belongs_to :customer
      t.float :total
      t.date :order_date
      t.string :status

      t.timestamps
    end
  end
end
