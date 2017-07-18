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

module Rack
  module Protection
    class HttpOrigin
      def accepts?(env)
        puts ["ENV", ENV].inspect
        puts ["env", env].inspect
        puts "safe?(env) => #{safe?(env)}"
        return true if safe? env
        puts "origin = #{env['HTTP_ORIGIN']}"
        return true unless origin = env['HTTP_ORIGIN']
        puts "base_url(env) == origin: #{base_url(env)} == #{origin} => #{base_url(env) == origin}"
        return true if base_url(env) == origin
        return true if options[:allow_if] && options[:allow_if].call(env)
        Array(options[:origin_whitelist]).include? origin
      end
    end
  end
end
