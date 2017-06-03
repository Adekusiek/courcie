class CreateDemandposts < ActiveRecord::Migration[5.1]
  def change
    create_table :demandposts do |t|
      t.string :city_from
      t.string :city_to
      t.date :expire_date
      t.text :item_description
      t.boolean :money_ok, default: true
      t.boolean :no_money_ok, default: true
      t.text :reward_description
      t.integer :user_id

      t.timestamps
    end
  end
end
