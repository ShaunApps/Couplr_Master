var req = new XMLHttpRequest();
req.open("GET", "https://maps.googleapis.com/maps/api/distancematrix/json?origins=" + current_user_address + "&destinations" + "&key=")

var distancematrix =
"https://maps.googleapis.com/maps/api/distancematrix/json?origins="+current_user_address+"&destinations="+other_user_address+"&key=#{ENV['google_matrix_key']}"

// $.ajax({
//   something here maybe
//   get url here, pass in /json
//   then test browser first to make sure controller is picking it up
// })



$.ajax({
  url: "https://maps.googleapis.com/maps/api/distancematrix/json?origins="+current_user_address+"&destinations="+other_user_address+"&key=#{ENV['google_matrix_key']}"

})



def get_nearby


  current_user_address = "#{params[:user][:street_number]}%20#{params[:user][:street_name]}%20#{params[:user][:city]}%20#{params[:user][:state]}%20#{params[:user][:country]}%20#{params[:user][:zip_code]}"
  other_user_address = "#{params[:user][:street_number]}%20#{params[:user][:street_name]}%20#{params[:user][:city]}%20#{params[:user][:state]}%20#{params[:user][:country]}%20#{params[:user][:zip_code]}"
  url = "https://maps.googleapis.com/maps/api/distancematrix/json?origins="+current_user_address+"&destinations="+other_user_address+"&key=#{ENV['google_matrix_key']}"

  response = HTTParty.get(url)

  if response['rows'][0]['elements']['distance']['value'] < 48280.3 #number of meters equivalent to ~30 miles.
    #display user as "nearby user"
  end

  response['results']['geometry']['location']['lat', 'long']

end



var current_user_address =
var other_user_address = other_user_address




function geocodeAddress(geocoder) {
  var address = document.getElementById('address').value;
  geocoder.geocode({'address': address}, function(results, status) {
    if (status === google.maps.GeocoderStatus.OK) {
      resultsMap.setCenter(results[0].geometry.location);
    
    } else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
  });
}
