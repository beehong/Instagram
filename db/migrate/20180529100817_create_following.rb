class CreateFollowing < ActiveRecord::Migration[5.1]
  def change
    create_table :followings do |t|
    	t.belongs_to :user
    	t.timestamps
    end

    create_table :followers do |a|
    	a.belongs_to :user
    	a.timestamps
    end

    create_table :follow do |b|
    	b.belongs_to :followings
    	b.belongs_to :followers
    	b.timestamps
    end
  end
end
