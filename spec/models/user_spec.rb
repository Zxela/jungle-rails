require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do

    it 'is valid' do
      validUser = User.create(name: "teasdst", email: "tasdst@test.com", password: "xxxxxxx", password_confirmation: "xxxxxxx")
      expect(validUser.valid?).to be true
    end

    it 'must have password' do
      invalidUser = User.create(name: "taest", email: "test@test.com",)
      expect(invalidUser.valid?).to be false
    end

    it 'must hav password and password_confirmation' do
      invalidUser = User.create(name: "tesasdt", email: "test@test.com", password: 'xxxxxxxxx', password_confirmation: "")
      expect(invalidUser.valid?).to be false
      invalidUser = User.create(name: "tesasdt", email: "test@test.com", password_confirmation: 'x')
      expect(invalidUser.valid?).to be false
    end

    it 'must have email' do
      invalidUser = User.create(name: "tesasdasdt", password: "xxxxxxx", password_confirmation: "xxxxxxx")
      expect(invalidUser.valid?).to be false
    end

    it 'must have unique email' do
      validUser = User.create(name: "testasd", email: "test@test.com", password: "xxxxxxx", password_confirmation: "xxxxxxx")
      invalidUser = User.create(name: "tesdddta", email: "TEST@test.com", password: "xxxxxxx", password_confirmation: "xxxxxxx")
      expect(invalidUser.valid?).to be false
    end

    it 'must have name' do
      invalidUser = User.create(email: "test@test.com", password: "xxxxxxx", password_confirmation: "xxxxxxx")
      expect(invalidUser.valid?).to be false
    end

	end

end
