class AddColumnForLike < ActiveRecord::Migration[5.1]
  def change
  	drop_table :likes

  	create_table :likes do |t|

    	t.belongs_to :user
    	t.belongs_to :post
    end
  end
end
