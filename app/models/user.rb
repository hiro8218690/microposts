class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :name , length: { maximum: 20 } , presence: true
  validates :description , length: { minimum: 2, maximum: 30 } , presence: true
  validates :location , length: { maximum: 20 } , presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  
end
