require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'self#show_customer_order' do
    it 'should return a array of results that match' do
      Category.create(
        name: 'Makanan'
      )
      Category.create(
        name: 'Minuman'
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
        category_id: 1
      )

      Order.create(
        customer_id: 1,
        total: 56000.0,
        order_date: '2020-10-10',
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

      result = { 'order_id' => 1, 'order_date' => '2020-10-10', 'name' => 'Mary Jones', 'email' => 'maryjones@gmail.com', 'total' => 56000.0, 'items' => 'Cordon Bleu,Spaghetti', 'status' => 'NEW' }

      expect(Order.show_customer_order).to include(result)
    end
  end
end
