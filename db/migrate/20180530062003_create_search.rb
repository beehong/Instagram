class CreateSearch < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
    	t.belongs_to :user
    end
  end
end
