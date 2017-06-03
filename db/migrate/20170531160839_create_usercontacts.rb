class CreateUsercontacts < ActiveRecord::Migration[5.1]
  def change
    create_table :usercontacts do |t|
      t.integer :user_id
      t.integer :contacted_id
      t.integer :messagebox_id

      t.timestamps
    end
  end
end
