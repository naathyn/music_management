class User < ActiveRecord::Base
  has_secure_password

  before_save { email.downcase! }
  before_save :create_remember_token

  validates_presence_of :email
  validates_uniqueness_of :email, case_sensitive: false

  validates_length_of :password, minimum: 6
  validates_confirmation_of :password_confirmation

protected

    def create_remember_token
      self.remember_token = SecureRandom.uuid
    end
end
