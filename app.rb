#this file is like app.js or server.js in our express apps

# you will always start it with these 2 lines
require 'bundler'
Bundler.require()

get '/' do
  "You just made a server! Good job u little coder u !! 😘"
end