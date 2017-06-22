class AddColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :message_notification, :boolean, default: true
    add_column :users, :request_notification, :boolean, default: true
  end
end
