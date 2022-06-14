class User < ApplicationRecord
  before_validation :create_api_key

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, :api_key

  has_secure_password

  def create_api_key
    self.api_key = SecureRandom.hex(16)
  end
end
