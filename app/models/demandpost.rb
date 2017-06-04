class Demandpost < ApplicationRecord
  belongs_to :user

  validates :city_to, presence: true
  validates :country_from, presence: true
  validates :item_description, presence: true
  validates :reward_description, presence: true

end
