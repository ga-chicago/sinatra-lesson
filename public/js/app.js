console.log("hey client js cool")

// retrieve the info -- we will eliminate this soon
$('button').on('click', (event) => {
  getPlaceList();
  $('button').off('click')
  $('button').remove()
})

function getPlaceList() {
  $.ajax({
    url: 'http://localhost:9292/placelist',
    dataType: 'JSON', 
    method: 'GET',
    success: function(response) {
      // store our data in "state"
      showButtons(response);
    }, 
    error: function(error) {
      console.error(error)
    }
  })
}

// store array index of each place in that button's dataset
// and add a listener that shows the correct div
function showButtons(listOfPlaces) {
  listOfPlaces.forEach((placeName, i) => {
    const $button = $('<button>').text(placeName)
    $button.data('which', i)
    $('#buttons').append($button);
  })

  // listener (event bubbling/delegation) to show the 
  //div corresponding to a particular button
  $('#buttons').on('click', 'button', (e) => {
    const placeIndex = $(e.currentTarget).data('which').toString()
    getPlace(placeIndex)
  })

}

function getPlace(index) {
  $.ajax({
    url: 'http://localhost:9292/place/' + index,
    method: 'GET',
    dataType: 'JSON',
    success: showPlace,
    fail: function(error) {
      console.error(error)
    }
  })
  function showPlace(place) {
    $('#places').empty();
    $('#places').append(
      $('<div>') 
      .css({
        "background-image": "url(" + place.image + ")",
        "background-size": "cover",
        "background-position": "center"
      })
      .text(place.name + " (" + place.country + ") ")
    )
  }
}