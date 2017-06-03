json.extract! demandpost, :id, :city_to, :city_from, :expire_date, :item_description, :money_ok, :no_money_ok, :reward_description, :user_id, :created_at, :updated_at
json.url demandpost_url(demandpost, format: :json)
