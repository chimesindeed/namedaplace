require_relative '../../config/environment.rb'
class SessionsController < ApplicationController

  post '/sessions' do
    login(params[:email], params[:password])
    @places = Place.all
    redirect to "/places"

    
  end

end
