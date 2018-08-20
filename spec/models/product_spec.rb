require 'rails_helper'

RSpec.describe Product, type: :model do
		
	describe 'Validations' do

    category = Category.create(name: "test")

		it 'is valid?' do
      testprod = Product.new(name: "test", price: 10, quantity: 1, description: "asksad", category: category)
      expect(testprod.valid?).to be true
		end

		it 'should have a name' do
      namefail = Product.new(price: 10, quantity: 1, description: "asksad", category: category )
      expect(namefail.valid?).to be false
      expect(namefail.errors.full_messages)
    end
    
    it 'should have a price' do
      pricefail = Product.new(name: "test", quantity: 1, description: "asksad",  category: category)
      expect(pricefail.valid?).to be false
      expect(pricefail.errors.full_messages)
    end		

    it 'should have a description' do
      descriptionfail = Product.new(name: "test", price: 10, quantity: 1,  category: category)
      expect(descriptionfail.valid?).to be false
      expect(descriptionfail.errors.full_messages)
    end

    it 'should have a quantity' do
      quantityfail = Product.new(name: "test", price: 10, description: "asksad",  category: category)
      expect(quantityfail.valid?).to be false
      expect(quantityfail.errors.full_messages)
		end

	end

end
