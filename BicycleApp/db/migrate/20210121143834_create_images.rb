class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.integer :post_id
      t.text :image_url

      t.timestamps

    end
    add_index :images, :post_id
  end
end
