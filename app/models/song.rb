class Song < ActiveRecord::Base
  attr_accessible :name, :rating, :user_id

  belongs_to :user
  has_many :comments
  has_and_belongs_to_many :genres
  
end
