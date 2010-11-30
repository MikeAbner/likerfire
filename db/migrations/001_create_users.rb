class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string  :facebook_id
      t.string  :name
      t.string  :first_name
      t.string  :last_name
      t.string  :nickname
      t.text    :token
    end
  end
  
  def self.down
    drop_table :users
  end
end