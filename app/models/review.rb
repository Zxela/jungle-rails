class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :product, presence: true
  validates :description, presence: true
  # uncomment to enforce rating
  # validates :rating, presence: true

end
