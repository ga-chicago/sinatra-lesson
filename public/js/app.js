console.log("hey client js cool")

let placeData = [];

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
      placeData = response
      showButtons();
      makeDivs();
    }, 
    error: function(error) {
      console.error(error)
    }
  })
}

function showButtons() {
  placeData.forEach((place, i) => {
    const $button = $('<button>').text(place.name)
    $button.data('which', i)
    $('#buttons').append($button);
  })

  $('#buttons').on('click', 'button', (e) => {
    // console.log($(e.currentTarget).data('which'))
    $('#places div').hide();
    $('#place-'+ $(e.currentTarget).data('which').toString()).show();
  })

}

function makeDivs() {
  placeData.forEach((place, i) => {
    const $placeDiv = $('<div>').css({
      "background-image": "url(" + place.image + ")",
      "background-size": "cover",
      "background-position": "center",
      "display": "none"
    }).text(place.name + " (" + place.country + ") ").attr("id", "place-" + i)
    $('#places').append($placeDiv)
  })
}