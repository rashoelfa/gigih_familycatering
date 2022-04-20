require 'rails_helper'

RSpec.describe MenuItem, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:menu_item)).to be_valid
  end

  it 'is valid with a name and a description' do
    expect(FactoryBot.build(:menu_item)).to be_valid
  end

  it 'is invalid without a name' do
    menu_item = FactoryBot.build(:menu_item, name: nil)
    menu_item.valid?
    expect(menu_item.errors[:name]).to include("can't be blank")
  end

  it 'is invalid with a duplicate name' do
    menu_item1 = FactoryBot.create(:menu_item, name: 'Nasi Uduk')
    menu_item2 = FactoryBot.build(:menu_item, name: 'Nasi Uduk')

    menu_item2.valid?

    expect(menu_item2.errors[:name]).to include('has already been taken')
  end

  it 'is invalid with a price less than 0.01' do
    menu_item = FactoryBot.build(:menu_item, price: 0.002)

    menu_item.valid?

    expect(menu_item.errors[:price]).to include('must be greater than or equal to 0.01')
  end

  it 'is invalid with a name that length of characters greater than 150 characters' do
    menu_item = FactoryBot.build(:menu_item, name: "
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nec risus egestas, scelerisque purus eu, semper quam. Praesent sed dolor arcu. Morbi tincidunt placerat eros, vel suscipit nisl aliquet id. Nullam id consectetur lectus. Curabitur eu mi in dolor ultrices lacinia. Duis mattis magna quis magna congue elementum. Donec vel dictum augue. Nulla facilisi. Suspendisse potenti. Proin diam risus, congue quis scelerisque ac, lobortis in arcu. Nulla aliquet tempus enim. Nulla sed augue iaculis, ultrices eros lobortis, dictum est. Nunc nec malesuada lacus, sit amet porta risus.

Cras mattis eros et mi tincidunt, id tincidunt est mollis. Maecenas dapibus tempor lacus vitae tincidunt. Vivamus sed eros nec mauris consectetur consectetur eu vitae felis. Suspendisse feugiat dui sed elit sollicitudin suscipit. Suspendisse nunc dolor, pharetra placerat nibh at, finibus pellentesque enim. Fusce quis ligula sed sem tincidunt vestibulum. Curabitur non ex ac est ullamcorper finibus. Nulla sit amet est arcu. Nulla iaculis iaculis turpis. Ut sed ipsum dolor. Proin a libero pretium, semper metus ac, condimentum orci. Ut varius pretium elit vel facilisis.

Etiam accumsan, nulla placerat maximus vestibulum, leo tortor finibus libero, et mollis magna leo eget orci. Nunc iaculis ex dolor, sed consequat eros efficitur vel. Suspendisse nunc nisi. ")

    menu_item.valid?

    expect(menu_item.errors[:name]).to include('150 characters is the maximum allowed')
  end
end
