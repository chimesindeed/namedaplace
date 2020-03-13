class PlacesController < ApplicationController
  
  get '/places' do
    "You are logged in as #{session[:email]}"
  end

  get '/places/new' do
    #checking if they are logged in
    if !logged_in?
      redirect "/login" #redirecting if not
    else
      "A new places form" #rendering if are
    end
  end
  
  get '/places/:id/edit' do
    #checking if they are logged in
    if !logged_in?
      redirect "/login" #redirecting if not
    else
      #place associated only with user that created it
      place = current_user.places.find(params[:id])
      
      "An edit place form #{current_user.id} is editing #{place.id}"
    end
    #binding.pry
  end
end
