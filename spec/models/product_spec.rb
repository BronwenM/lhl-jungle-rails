require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'is valid with all required fields' do
      @category = Category.new(name: "trees")
      @product = Product.new(name: "Meyer Lemon", price_cents: 140, quantity: 24, category: @category)
      expect(@product).to be_valid
    end

    it 'is not valid without a name' do
      @category = Category.new(name: "trees")
      @product = Product.new(name: nil, price_cents: 140, quantity: 24, category: @category)
      expect(@product).to_not be_valid
    end

    it 'is not valid without a price' do
      @category = Category.new(name: "trees")
      @product = Product.new(name: "Meyer Lemon", price_cents: nil, quantity: 24, category: @category)
      expect(@product).to_not be_valid
    end

    it 'is not valid without a quantity' do
      @category = Category.new(name: "trees")
      @product = Product.new(name: "Meyer Lemon", price_cents: 140, quantity: nil, category: @category)
      expect(@product).to_not be_valid
    end

    it 'is not valid without a category' do
      @product = Product.new(name: "Meyer Lemon", price_cents: 140, quantity: nil, category: nil)
      expect(@product).to_not be_valid
    end
    
  end
end