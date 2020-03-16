require_relative '../../config/environment.rb'
class SessionsController < ApplicationController

  #note: needed to  enable :sessions key in config block in main controller and
  #set :session_secret - to enable layer of session authentification
  
  post '/sessions' do
    login(params[:email], params[:password])
    redirect to "/places"
    
  end
  
end
