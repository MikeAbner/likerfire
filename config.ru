require 'omniauth'
require 'likerfire'

use Rack::Session::Cookie
use OmniAuth::Builder do
  provider :facebook, '120636147999305', 'ec9907d434b57abe3737db0b5bb46cf1', {:scope => "user_likes,friends_likes"} 
end

run Likerfire


