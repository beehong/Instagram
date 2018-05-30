class DropTable < ActiveRecord::Migration[5.1]
  def change
  	drop_table :users

  	create_table :users do |t|
 	 	t.string :email
       	t.string :password
      	t.string :username
      	t.string :gender
      	t.json :profile_photo
      	t.integer :role , default:0


      

      t.timestamps
  	end
  end
end
