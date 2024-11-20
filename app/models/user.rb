class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, confirmation: true, length: {minimum: 6}
  validates :password_confirmation, presence: true
  before_save :downcase_email

  def self.authenticate_with_credentials(email, password)
    User.find_by(email: email.strip.downcase)&.authenticate(password)
  end

  def downcase_email
    self.email.downcase!
  end
end
