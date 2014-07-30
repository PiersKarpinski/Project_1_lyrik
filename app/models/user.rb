class User < ActiveRecord::Base
  attr_accessible :email, :image, :name, :username, :password, :password_confirmation

    has_secure_password

  has_many :songs
  has_many :comments

  validates :name, length: { in: 4..255 }, uniqueness: true
  validates :username, length: { in: 4..255 }, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true


  mount_uploader :image, ImageUploader

  def role?(role)
    self.role.to_s == role.to_s
  end
end
