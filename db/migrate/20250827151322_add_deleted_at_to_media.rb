class AddDeletedAtToMedia < ActiveRecord::Migration[8.0]
  def change
    add_column :media, :deleted_at, :datetime
    add_index :media, :deleted_at
  end
end
