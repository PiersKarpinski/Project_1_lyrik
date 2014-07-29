class User < ActiveRecord::Base
  attr_accessible :email, :image, :name, :username

  has_many :songs
  has_many :comments

end
