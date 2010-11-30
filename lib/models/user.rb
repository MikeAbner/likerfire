class User < ActiveRecord::Base
  
  def self.create_or_update_with auth_hash
    pp auth_hash
  end
  
end