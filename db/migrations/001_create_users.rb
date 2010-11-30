class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :f_name
      t.string :l_name
    end
  end
  
  def self.down
    drop_table :users
  end
end