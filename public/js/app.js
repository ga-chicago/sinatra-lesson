console.log("hey client js cool")

$('button').on('click', (event) => {


  $.ajax({
    url: 'http://localhost:9292/places_to_go',
    dataType: 'JSON', // if you forget this you would have to JSON.parse(the response)
    method: 'GET',
    // success: function(response) {
    //   console.log(response)
    // }, 
    success: makeDivs,
    fail: function(error) {
      console.error(error)
    }
  })

})

function makeDivs(response) {
  response.forEach(place => {
    const $placeDiv = $('<div>').css({
      "background-image": "url(" + place.image + ")"
    }).text(place.name + " (" + place.country + ") ")
    $('#places').append($placeDiv)
  })
}