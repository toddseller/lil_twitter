require 'bcrypt'

class User < ActiveRecord::Base
  has_many :followers, class_name "User", foreign_key: ""
  has_many

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
