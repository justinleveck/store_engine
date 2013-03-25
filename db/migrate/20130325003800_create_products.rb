class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title, :null=>false
      t.text :description, :null=>false
      t.decimal :price, :precision => 30, :scale => 10

      t.timestamps
    end
    add_index :products, :title, :unique => true

  end
end
