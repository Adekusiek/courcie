class Message < ApplicationRecord
  belongs_to :user_from, class_name: 'User'
  belongs_to :user_to, class_name: 'User'
  belongs_to :messagebox
  
  validates :content, presence: true
  validates :user_from_id, presence: true
  validates :user_to_id, presence: true
end
