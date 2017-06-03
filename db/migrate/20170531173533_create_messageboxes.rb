class CreateMessageboxes < ActiveRecord::Migration[5.1]
  def change
    create_table :messageboxes do |t|

      t.timestamps
    end
  end
end
