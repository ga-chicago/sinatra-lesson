#this file is like app.js or server.js in our express apps

# you will always start it with these 2 lines
require 'bundler'
Bundler.require()

get '/' do

  # this is like res.send(...) in express
  # remember the last line of any method is what it will return
  "You just made a server! Good job u little coder u !! 😘"

end

# define a route -- do not have a trailing slash
get '/hello' do
  "Hello World"
end


#  URL parameters like so
get '/hello/:some_param' do
  # note: URL parameters are stored in params hash
  # automatically for u
  the_param = params['some_param']

  "Hello, #{the_param}"

end


# render a template - we will use erb which is the templating 
# engine that comes with Ruby
get '/template' do

  # note: specify the template name with a symbol
  erb :index
end



