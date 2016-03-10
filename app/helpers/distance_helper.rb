class DistanceController < ApplicationController


  def get_nearby


    current_user_address = "#{params[:user][:street_number]}%20#{params[:user][:street_name]}%20#{params[:user][:city]}%20#{params[:user][:state]}%20#{params[:user][:country]}%20#{params[:user][:zip_code]}"
    other_user_address = "#{params[:user][:street_number]}%20#{params[:user][:street_name]}%20#{params[:user][:city]}%20#{params[:user][:state]}%20#{params[:user][:country]}%20#{params[:user][:zip_code]}"
    url = "https://maps.googleapis.com/maps/api/distancematrix/json?origins="+current_user_address+"&destinations="+other_user_address+"&key=#{ENV['googleapikey']}"

    response = HTTParty.get(url)

    if response['rows'][0]['elements']['distance']['value'] < 48280.3 #number of meters equivalent to ~30 miles.
      #display user as "nearby user"


    end

end
