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
  # thhis is like res.render() in express
  erb :index
end

# partials are included in a "layout.erb" (it has to be called that) view
# via the yield statement


# lets pass data to our template
get '/friendster' do
  # any INSTANCE variables you delcare will be passed to
  # the templat(ing engin)e automatically
  @page_title = "Some friends"
  @message = "Thank for useing friendster here are the friends"
  @friends = [
    {
      name: "Zoe",
      hair: "blonde"
    },
    {
      name: "Irwin",
      hair: "hat"
    },
    {
      name: "Ben",
      hair: "light brown"
    },
    {
      name: "MJ",
      hair: "brown"
    }
  ]
  erb :friends


end



# what if we wanna send back JSON

get '/somejson' do
  data_to_return = {
    message: "Hey i'm the somejson route"
  }
  # this is like res.json() in express 
  data_to_return.to_json

end


# json and params
get '/params_and_json/:some_param' do
  {
    status: 200,
    message: "Thanks for visiting the route at #{params[:some_param]}"
  }.to_json

end



