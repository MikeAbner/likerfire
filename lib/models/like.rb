# An object holding Like details.
# Mainly useful so you don't have to deal with hashes all the time.
class Like
  attr_accessor :id, :name, :category
  
  def initialize(id, name, category)
    @id = id
    @name = name
    @category = category
  end
  
  # override the == method so we can compare two Like objects to eachother
  # the primary reason this is done in this app is so the Array.include?
  # method works
  def ==(other)
    id == other.id and name == other.name and category == other.category
  end
end