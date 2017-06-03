class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :content
      t.integer :user_to_id
      t.integer :user_from_id
      t.integer :messagebox_id
      
      t.timestamps
    end
  end
end
