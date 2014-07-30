class Song < ActiveRecord::Base
  attr_accessible :name, :rating, :user_id, :lyrik, :genre_ids, :comment_ids

  belongs_to :user
  has_many :comments
  has_and_belongs_to_many :genres

  validates :name, presence: true, uniqueness: true
  validates :lyrik, presence: true, uniqueness: true

  mount_uploader :lyrik, LyrikUploader

end
