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


# you do: write an '/enemies' route  that sends back array of "enemy" hashes as JSON
get '/enemies' do
  enemies = [
    {
      name: "Nico",
      type: "Cat",
      hobby: "being irritable towards anyone who doesn't have something he wants"
    },
    {
      name: "Nikolai",
      type: "Grumpy intractable cat",
      hobby: "tries to get you to pet him then bites your hand when you do"
    },   
    {
      name: "Ocin",
      type: "Deeply evil cat",
      hobby: "dreaming about how he would eat you in your sleep if only he were a little bit larger"
    }
  ]
  enemies.to_json

end

# THIS IS CHEATING
# DO NOT PUT DATA IN THE TOP LEVEL OF YOUR APPLICATION CONTROLLER
# OR ANY OTHER CONTROLLER 
# WE JUST DID IT HERE FOR THE SAKE OF THIS EXERCISE
$places = [
  {
    name: "Alaska",
    country: "USA",
    image: "https://defenders.org/sites/default/files/styles/homepage-feature-2015/public/alaska_denali_peggy-bechtell.png?itok=4y4v5-tX"
  },
  {
    name: "Loire Valley",
    country: "France",
    image: "https://media-cdn.tripadvisor.com/media/photo-s/04/9c/65/21/acco-dispo-private-day.jpg"
  },
  {
    name: "Adjara Region",
    country: "საკართველო",
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAM2A5-pjfizlS2zXHT88Agqlqp9NG3cOCP5IBqmctA3ane8QIsw"
  },
  {
    name: "New Orleans",
    country: "USA",
    image: "http://www4.pictures.lonny.com/mp/8UxoNNPgUP2l.jpg"
  },
  {
    name: "Lithuania",
    country: "Lithuania",
    image: "https://2h7qju2c3qvcc3s86ekn8n0-wpengine.netdna-ssl.com/wp-content/uploads/2017/12/shutterstock_vilnius-lithuania.jpg"
  }
]

# write a route at "/places_to_go" 
  # this route should return an array as JSON with 5 place hashes
  # properties must include: name, image
  # you can include whatever else you want


get '/places' do 

  @page_title = "places i wanna visit"

  erb :places_to_go

end

get '/places_to_go' do
    # ordinarily our data will come from a model (i.e. the database)
    # places = some_logic_to_get_stuff_from_databse
    # ... or maybe an ajax call
    # places = somethingFromSomeAjaxCallOrEtc

    # for now we just use the global data
    $places.to_json

end


# create a template called places_to_go.erb
  # you will need a route that just renders this template
  # have a button 
  # (if you want you could have a button for each place--you would need to make the places_to_go array global to be able to access it from both routes)

# client-side JS
  # add jQuery
  # when the button is clicked, use AJAX to hit your JSON route
  # parse the returned JSON data and display on the page

# if time, figure out a way to have a link (if you didn't do the button thing above) to each place and clicking that link will show just the data for that place



