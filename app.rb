require "sinatra"
require "json"

set :bind, "0.0.0.0"

get "/" do
  content_type "text/html"
  <<HTML
  <form action="/poke" method="POST">
    <input type="hidden" name="authenticity_token" value="#{session[:csrf]}"/>
    <input type="submit" value="poke"/>
  </form>
HTML
end

post "/poke" do
  content_type "text/html"
  <<HTML
  <p>cool!</p>
HTML
end
