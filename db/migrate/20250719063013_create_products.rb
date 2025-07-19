class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.string :slug,  null: false
      t.text :description
      t.integer :price, null: false
      t.integer :old_price

      t.timestamps
    end

    add_index :products, "lower(title)", unique: true
    add_index :products, "lower(slug)",  unique: true
  end
end
