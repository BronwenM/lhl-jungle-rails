class User < ApplicationRecord
  
  has_secure_password

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, confirmation: true, length: {minimum: 6}
  validates :password_confirmation, presence: true

  def authenticate_with_credentials(email, password)
    return if User.find_by(email: email)&.authenticate(password)
  end
end
