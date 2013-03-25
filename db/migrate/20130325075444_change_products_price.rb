class ChangeProductsPrice < ActiveRecord::Migration
  def up
    change_column :products, :price, :decimal, :precision => 8, :scale => 2
  end

  def down
    change_column :products, :price, :decimal, :precision => 30, :scale => 10
  end
end
