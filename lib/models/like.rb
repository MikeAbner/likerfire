class Like
  attr_accessor :id, :name, :category, :created_time
  
  def initialize(id, name, category, created_time)
    @id = id
    @name = name
    @category = category
    @created_time = created_time
  end
end