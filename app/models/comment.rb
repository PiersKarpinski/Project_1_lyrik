class Comment < ActiveRecord::Base
  attr_accessible :content, :song_id, :user

  belongs_to :song
  belongs_to :user

  validates :content, length: { in: 1..500 }



end
