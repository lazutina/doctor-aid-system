class User < ApplicationRecord
  has_secure_password

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :password, presence: true, length: { minimum: 6}
  validates :password_confirmation, presence: true
  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, :email_format => { :message => 'is not valid' }

  private
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
