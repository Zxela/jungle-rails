require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    @product = @category.products.find(1)
  end

  scenario "They see a products details" do
    # ACT
    visit root_path
    
    click_link 'Details'

    # DEBUG / VERIFY
    page.find('.products-show')
    save_screenshot

    expect(page).to have_text 'Quantity'
  end

end
