class CreateItineraries < ActiveRecord::Migration[5.1]
  def change
    create_table :itineraries do |t|
      t.string :country_from
      t.string :city_to
      t.date :departure_date
      t.integer :user_id

      t.timestamps
    end
  end
end
