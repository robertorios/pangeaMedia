class AddTagsToMedia < ActiveRecord::Migration[8.0]
  def change
    add_column :media, :tags, :string
  end
end
