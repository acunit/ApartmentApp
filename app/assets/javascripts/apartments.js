function createGmap(dataFromServer) {
  var handler = Gmaps.build('Google'); //maybe builds a map based on google maps?
  handler.buildMap({
    provider: {},
    internal: {id: 'apartment_map'}
  },
  function() {
    markers = handler.addMarkers(dataFromServer);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
    handler.getMap().setZoom(12);
  }
);
};

function showLocations(dataFromServer){
  var handler = Gmaps.build('Google'); //maybe builds a map based on google maps?
  handler.buildMap({
    provider: {},
    internal: {id: 'index_map'}
  },
  function() {
    markers = handler.addMarkers(dataFromServer);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
    handler.getMap().setZoom(12);
  }
);
}

function loadAndCreateGmap() {
   // Only load map data if we have a map on the page
  if($("#apartment_map").length > 0 ){
    // Access the data-apartment-id attribute on the map element
    var apartmentId = $("#apartment_map").attr("data-apartment-id");

    $.ajax({
      dataType: 'json',
      url: '/apartments/' + apartmentId + '/map_location',
      method: 'GET',
      success: function(dataFromServer){
        createGmap(dataFromServer);
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert("Getting map data failed: " + errorThrown);
      }
    });
  }
  else if ($("#index_map").length > 0) {
    $.ajax({
      dataType: 'json',
      url: '/apartments',
      method: 'GET',
      success:function(dataFromServer){
        showLocations(dataFromServer)
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert("Getting map data failed: " + errorThrown);
      }
    })

  }
};



//Create the map when the page loads for the first time
$(document).on('ready', loadAndCreateGmap);