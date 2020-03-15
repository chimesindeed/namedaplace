class PlacesController < ApplicationController
  
  get '/places' do
    @places = Place.all
    erb :"places.html"
  end

  get '/places/new' do
    #checking if they are logged in
    if !logged_in?
      redirect "/login" #redirecting if not
    else
      @places = Place.all
      erb :"new_place.html"
    end
  end
  
  get '/places/:id' do |id|
    @place = Place.find(id.to_i)
    erb :"show_place"
  end
  
  get '/places/:id/edit' do
    #checking if they are logged in
    if !logged_in?
      redirect "/login" #redirecting if not
    else
      #place associated only with user that created it
      place = current_user.places.find(params[:id])
      
      "An edit place form #{current_user.id} is editing #{place.id}"
      erb :"edit_place"
    end
  end
  
  post '/places' do
    create_place
    redirect to("/places/#{@places.id}")
  end
  
  put '/places/:id' do
    place = find_place
    place.update(params[:place])
    redirect to("/places/#{place.id}")
  end
  
  delete '/places/:id' do
    find_place.destroy
    redirect to('/places')
  end
  
  
  
 
end
