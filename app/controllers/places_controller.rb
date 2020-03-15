class PlacesController < ApplicationController
  
  get '/places' do
    #checking if they are logged in
    if !logged_in?
      redirect to "/login" #redirecting if not
    else
    @places = Place.all.select do |place|
      place.user_id == current_user[:id]
    end
    erb :"/places/places.html"
    end
  end
  
  get '/places/new' do
    #checking if they are logged in
    if !logged_in?
      redirect to "/login" #redirecting if not
    else
      @places = Place.all
      erb :"/places/new_place.html"
    end
  end
  
  get '/places/:id' do  #checking if they are logged in
    if !logged_in?
      redirect to "/login" #redirecting if not|id|
    else
      @place = Place.find(params[:id].to_i)
      if @place.user_id==current_user.id
        erb :"places/show_place.html"
      else
        redirect to "/login"
      end
    end
  end
  
  get '/places/:id/edit' do
    if !logged_in? #checking if they are logged
      redirect to"/login" #redirecting if not
    else
      @place = Place.find(params[:id].to_i)
      if @place.user_id==current_user.id
        erb :"places/edit_place.html"
      else redirect to '/'
      
      end
  end
  end
  
  post '/places' do
    binding.pry
    Place.create(name: params[:name], notes: params[:notes])
    redirect to("/places")
  end
  
  put '/places/:id' do |id|
    @place = Place.find(params[:id].to_i)
    @place.update(params[:place])
    redirect to("/places")
  end
  
  delete '/places/:id' do
    find_place.destroy
    redirect to('/places')
  end
 
end
