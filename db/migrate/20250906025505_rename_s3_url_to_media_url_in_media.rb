class RenameS3UrlToMediaUrlInMedia < ActiveRecord::Migration[8.0]
  def change
    rename_column :media, :s3_url, :media_url
  end
end
