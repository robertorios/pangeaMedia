class AddChatAllowedToMedia < ActiveRecord::Migration[8.0]
  def change
    add_column :media, :chat_allowed, :boolean, default: false, null: false
  end
end
