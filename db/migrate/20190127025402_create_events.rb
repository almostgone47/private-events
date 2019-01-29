class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
    	t.string :title
    	t.string :body
    	t.date :date
    	t.integer :creator_id

      t.timestamps
    end
  end
end
