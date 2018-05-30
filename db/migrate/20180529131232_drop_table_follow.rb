class DropTableFollow < ActiveRecord::Migration[5.1]
  def change
  	drop_table :follow

  	create_table :follows do |t|
 	 	t.belongs_to :following
       	t.belongs_to :follower
      	


      

      t.timestamps
  end
  end
end
