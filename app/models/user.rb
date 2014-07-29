class User < ActiveRecord::Base
  attr_accessible :email, :image, :name, :username, :password, :password_confirmation

    has_secure_password

  has_many :songs
  has_many :comments

  mount_uploader :image, ImageUploader

end
