function initialize(){
    var input_from = document.getElementById('city_from');
    var input_to = document.getElementById('city_to');

    var options = {
        types: ['(cities)'],
    };
    autocomplete = new google.maps.places.Autocomplete( input_from, options);
    autocomplete = new google.maps.places.Autocomplete( input_to, options);
}

google.maps.event.addDomListener(window, 'load', initialize);

$(document).ready(function(){
   $('#signup-modal').modal('show');
});
