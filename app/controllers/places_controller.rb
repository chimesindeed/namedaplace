class PlacesController < ApplicationController
  
  get '/places' do
    #checking if they are logged in
    if !logged_in?
      redirect to "/login" #redirecting if not
    else
      @places = Place.all.select do |place|
        place.user_id == current_user[:id]#.user_id makes use of -Each Place Object "belongs to" A User- display all places that belong current_user
                                          #current_user method declared as helper in ApplicationController
      end    
    erb :"/places/places.html"
    end
  end
  
  get '/places/new' do
    if !logged_in?
      redirect to "/login"
    else
      @places = Place.all
      erb :"/places/new_place.html"
    end
  end
  
  get '/places/:id' do
    if !logged_in?
      redirect to "/login"
    else
      @place = Place.find(params[:id].to_i) #Query database via ActiveRecord and pull record of place with id of /:id.
      if @place.user_id==current_user.id
        erb :"places/show_place.html" #is only displayed if it is one of the logged in users places.
      else
        redirect to "/login"
      end
    end
  end
  
  get '/places/:id/edit' do
    if !logged_in?
      redirect to"/login"
    else
      @place = Place.find(params[:id].to_i)
      if @place.user_id==current_user.id
        erb :"places/edit_place.html"
      else redirect to '/'
      
      end
    end
  end
  
  post '/places' do #makes use of places belong to a user --instead of Place.create - current_user.create will assign user_id to place
    current_user.places.create(name: params[:name], notes: params[:notes])
    redirect to("/places")
  end
  
  put '/places/:id' do |id| #put works only because in erb file that issues request --had to explicitly declare input type=hidden value=_method 'put'
    @place = Place.find(params[:id].to_i)
    @place.update(params[:place])
    redirect to("/places")
  end
  
  delete '/places/:id' do #same patch as above for delete method.
    Place.find_by(:id => params[:id]).destroy
    redirect to('/places')
  end
 
end
