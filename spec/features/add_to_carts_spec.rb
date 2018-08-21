require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: :true do
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
  end

  scenario "They can add item to cart" do
    # ACT
    visit root_path
    click_link "Add"
    

    # DEBUG / VERIFY
    page.find('a', text: "My Cart")
    save_screenshot

    expect(page).to have_text "Login"
  end
end
