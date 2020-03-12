class PlacesController < ApplicationController
  
  get '/places' do
    "You are logged in as #{session[:email]}"
  end
end
