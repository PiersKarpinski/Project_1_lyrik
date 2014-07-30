class Genre < ActiveRecord::Base
  attr_accessible :name, :song_ids

  has_and_belongs_to_many :songs
  
end
