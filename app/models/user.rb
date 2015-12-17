class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :name , length: { maximum: 20 } , presence: true
  validates :description , length: { minimum: 2, maximum: 30 } , presence: true, on: :update
  validates :location , length: { maximum: 20 } , presence: true, on: :update
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
<<<<<<< HEAD
  has_many :microposts
  
  has_many :following_relationships, class_name:  "Relationship",
                                     foreign_key: "follower_id",
                                     dependent:   :destroy
  has_many :following_users, through: :following_relationships, source: :followed
  
  #他のユーザーをフォローする
  def follow(other_user)
    following_relationships.find_or_create_by(followed_id: other_user.id)
  end
  
  #フォローしているユーザーをあんフォローする
  def unfollow(other_user)
    following_relationships = following_relationships.find_by(followed_id: other_user.id)
    following_relationships.destroy if following_relationships
  end
  
  #あるユーザーをフォローしているかどうか？
  def following?(other_user)
    following_users.inclede?(other_user)
  end
=======
>>>>>>> user-profile
  
end
