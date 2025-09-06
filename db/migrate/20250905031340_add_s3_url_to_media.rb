class AddS3UrlToMedia < ActiveRecord::Migration[8.0]
  def change
    add_column :media, :s3_url, :string
  end
end
