class Like
  attr_accessor :id, :name, :category
  
  def initialize(id, name, category)
    @id = id
    @name = name
    @category = category
  end
  
  def ==(other)
    id == other.id and name == other.name and category == other.category
  end
end