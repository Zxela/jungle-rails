class User < ActiveRecord::Base
    
  has_secure_password
  has_many :reviews

  
  validates :password, length: { minimum: 6 } 
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensative: false }
  before_save { email.downcase! }
  
  def self.authenticate_with_credentials(email, password)
    email.strip!
    email.downcase!
    user = User.find_by(email: email)
    if user && user.authenticate(password)
      return user
    end
    return nil
  end

end
  
