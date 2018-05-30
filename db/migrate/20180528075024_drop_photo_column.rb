class DropPhotoColumn < ActiveRecord::Migration[5.1]
  def change
  	remove_column :users, :profile_photo

  	add_column :users, :profile_photo, :string
  end
end
