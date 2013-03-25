class SorceryCore < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :display_name
      t.string :first_name,       :null => false
      t.string :last_name,        :null => false
      t.string :email,            :null => false
      t.string :crypted_password, :default => nil
      t.string :salt,             :default => nil

      t.timestamps
    end
    add_index :users, :email, :unique => true
  end

  def self.down
    drop_table :users
  end
end