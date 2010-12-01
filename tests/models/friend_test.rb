class FriendTest < Test::Unit::TestCase
  def test_it_should_initialize_correctly
    friend = Friend.new(1234, "Liz")
    
    assert friend.id == 1234
    assert friend.name == "Liz"
  end
end