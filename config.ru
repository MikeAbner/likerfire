require 'omniauth'
require 'likerfire'

use Rack::Session::Cookie
use OmniAuth::Builder do
  provider :facebook, '', ''
end

run Likerfire

