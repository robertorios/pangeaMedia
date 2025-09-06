class AddS3KeyToMedia < ActiveRecord::Migration[8.0]
  def change
    add_column :media, :s3_key, :string
  end
end
