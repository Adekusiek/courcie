class Demandpost < ApplicationRecord
  belongs_to :user

  validates :city_from, presence: true
  validates :city_to, presence: true
  validates :expire_date, presence: true
  validates :item_description, presence: true
  validates :reward_description, presence: true

end
