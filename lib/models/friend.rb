# An object holding friend details.
# Mainly useful so you don't have to deal with hashes all the time.
class Friend
  attr_accessor :id, :name
  
  def initialize(id, name)
    @id = id
    @name = name
  end
end