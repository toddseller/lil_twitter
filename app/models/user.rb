require 'bcrypt'

class User < ActiveRecord::Base
  has_many :tweets, dependent: :destroy

  has_many :follower_follows, foreign_key: :followee_id, class_name: Follower
  has_many :followers, through: :follower_follows, source: :follower

  has_many :followee_follows, foreign_key: :followee_id, class_name: Follower
  has_many :followees, through: :followee_follows, source: :followee

  validates :full_name, :email, :username, :password_hash, presence: true

  def password
  	@password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
  	@password = BCrypt::Password.create(new_password)
  	self.password_hash = @password
  end

  def authenticate(password)
  	self.password == password
  end
end
