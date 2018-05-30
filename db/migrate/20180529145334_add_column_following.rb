class AddColumnFollowing < ActiveRecord::Migration[5.1]
  def change
  	add_column :followings, :following_user_id, :integer

  end
end
