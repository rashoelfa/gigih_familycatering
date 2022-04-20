require 'rails_helper'

RSpec.describe Customer, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:customer)).to be_valid
  end

  it 'is invalid with not email formatted' do
    customer = FactoryBot.build(:customer, email: "mysite.ourearth.com")
    customer.valid?
    expect(customer.errors[:email]).to include("must insert email format")
  end
end
