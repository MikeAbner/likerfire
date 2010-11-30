require 'likerfire'
require 'test/unit'
require 'rack/test'

class RootTest < Test::Unit::TestCase
  include Rack::Test::Methods
  
  def app
    Likerfire.new
  end
  
  def test_it_responds_to_slash
    get '/'
    assert last_response.status == 200
    assert last_response.body =~ /Welcome to Likerfire/
    assert last_response.body =~ /log in to Facebook/
  end
end