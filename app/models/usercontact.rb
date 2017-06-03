class Usercontact < ApplicationRecord
  belongs_to :user
  belongs_to :contacted, class_name: 'User'
  belongs_to :messagebox
  has_many :messages, through: :messagebox

  validates :user_id, presence: true
  validates :contacted, presence: true
end
