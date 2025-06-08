class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # Removed :registerable and :recoverable to disable signup and password reset
  devise :database_authenticatable, :rememberable, :validatable
end
