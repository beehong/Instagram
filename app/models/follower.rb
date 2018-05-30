class Follower < ApplicationRecord
	has_many :follows
	belongs_to :user
end
