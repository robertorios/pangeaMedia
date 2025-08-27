class CreateMedia < ActiveRecord::Migration[8.0]
  def change
    create_table :media do |t|
      t.string :title
      t.text :description
      t.string :media_url
      t.integer :user_id
      t.string :visibility
      t.string :media_type

      t.timestamps
    end
  end
end
