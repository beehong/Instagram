class User < ApplicationRecord
  include PgSearch
  enum role: [ :customer, :admin]
  has_secure_password
  has_many :posts
  has_many :likes
  has_many :comments
  has_many :followings
  has_many :followers
  has_many :searches
  mount_uploader :profile_photo, AvatarUploader
  validates :email, presence:true, uniqueness: true

 
  pg_search_scope :search_by_username, :against => :username

  
  def self.search_user(query)
    where("username ILIKE :username", username: "%#{query}%").map do |record|
      record.username
    end
  end

end