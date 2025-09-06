class RemoveMediaUrlFromMedia < ActiveRecord::Migration[8.0]
  def change
    remove_column :media, :media_url, :string
  end
end
