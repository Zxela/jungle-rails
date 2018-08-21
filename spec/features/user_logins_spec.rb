require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: :true do
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
      @user = User.create!( 
        email: 'alex@gmail.com', 
        name: 'Alex Z', 
        password: 'test123'
        )
      end
  
    scenario "They can add item to cart" do
      # ACT
      visit root_path
      click_link "Login"

      fill_in :email, with: 
      'alex@gmail.com'      
      fill_in :password, with: "test123"
      click_button 'Submit'

      # DEBUG / VERIFY
      page.find('a', text: "My Cart")
      save_screenshot
  
      expect(page).to have_text "You have successfully logged in!"
    end
end
