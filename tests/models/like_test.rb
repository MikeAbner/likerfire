class LikeTest < Test::Unit::TestCase
  
  def test_it_should_initialize_properly
    like = Like.new(1234, "one", "test")
    
    assert like.id == 1234
    assert like.name == "one"
    assert like.category == "test"
  end
  
  def test_it_should_test_equality_correctly
    a = Like.new(1234, "one", "test")
    b = Like.new(1235, "two", "test") #different id
    c = Like.new(1234, "one", "test")
    d = Like.new(1234, "two", "test") #different name
    e = Like.new(1234, "one", "other") #diferent category
    f = Like.new(5342, "xyz", "eek!") #different everything
    
    assert a != b
    assert a == c
    assert b != c
    assert a != d
    assert c != e
    assert a != f
  end
  
  #a second test to be sure Array.include? uses the == operator
  #to determine object equality.
  def test_it_should_work_with_array_dot_include
    a = Like.new(1234, "one", "test")
    b = Like.new(1235, "two", "test")
    c = Like.new(1234, "one", "test")
    d = Like.new(4362, "blabber", "blahdeblah")
    arr = [a, d]
    
    assert arr.include?(a)
    assert arr.include?(d)
    assert !arr.include?(b)
    assert arr.include?(c)
  end
  
end