class Post < ApplicationRecord
	belongs_to :user
	has_many :likes
	has_many :comments
	mount_uploaders :image, AvatarUploader
end
