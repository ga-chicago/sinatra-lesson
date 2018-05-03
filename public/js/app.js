console.log("hey client js cool")

// for fun, i used react-like "initial state" data
let placeData = [];

// retrieve the info -- we will eliminate this soon
$('button').on('click', (event) => {
  getInfo();
  $('button').off('click')
  $('button').remove()
})

function getInfo() {
  $.ajax({
    url: 'http://localhost:9292/places_to_go',
    dataType: 'JSON', 
    method: 'GET',
    success: function(response) {
      // store our data in "state"
      placeData = response

      makeDivs();
      showButtons();
    }, 
    error: function(error) {
      console.error(error)
    }
  })
}

// store array index of each place in that button's dataset
// and add a listener that shows the correct div
function showButtons() {
  placeData.forEach((place, i) => {
    const $button = $('<button>').text(place.name)
    $button.data('which', i)
    $('#buttons').append($button);
  })

  // listener (event bubbling/delegation) to show the 
  //div corresponding to a particular button
  $('#buttons').on('click', 'button', (e) => {
    $('#places div').hide();
    $('#place-'+ $(e.currentTarget).data('which').toString()).show();
  })

}

function makeDivs() {

  // build/add a hidden div for each place
  placeData.forEach((place, i) => {

    const $placeDiv = $('<div>') // line-broke chained methods for readability
      .css({
        "background-image": "url(" + place.image + ")",
        "background-size": "cover",
        "background-position": "center",

        // note: jQuery hide() adds display:none and jQuery show() removes it
        "display": "none" 
      })
      .text(place.name + " (" + place.country + ") ")
      // id corresponds to this place's index in placeData array
      .attr("id", "place-" + i) 

    $('#places').append($placeDiv);

  })
}