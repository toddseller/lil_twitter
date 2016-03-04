class User < ActiveRecord::Base
  validates :full_name, :email, :username, :password_hash, presence: true
end
