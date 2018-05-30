class CreateComment < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
    	t.belongs_to :user
    	t.belongs_to :post
    	t.string :description
    	 t.timestamps
    end
  end
end
