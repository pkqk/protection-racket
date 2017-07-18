require_relative "app"

use Rack::Session::Cookie, secret: "tell-no-one"
use Rack::Protection, use: :authenticity_token
run Sinatra::Application
