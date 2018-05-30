class AddColumnFollower < ActiveRecord::Migration[5.1]
  def change
  	add_column :followers, :follower_user_id, :integer

  end
end
