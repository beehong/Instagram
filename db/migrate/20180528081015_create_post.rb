class CreatePost < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
    	t.belongs_to :user
    	t.string :caption
      	t.json :image


      

      t.timestamps

    end
  end
end
