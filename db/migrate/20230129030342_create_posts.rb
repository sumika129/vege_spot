class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.integer :user_id
      t.integer :area_id
      t.integer :category_id
      t.string :shop
      t.string :item
      t.text :impression
      t.timestamps
    end
  end
end
