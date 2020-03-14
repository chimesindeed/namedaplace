require_relative '../../config/environment.rb'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'

    enable :sessions #needed for session authentification
    set :session_secret, "amadeusamadeus"
  end

  
  get '/' do
    redirect "/welcome"
  end
  
  get '/welcome' do
    erb :"welcome.html"
  end

  get '/signup' do
    erb :"users/new.html"
  end
  
  get '/login' do
    erb :"login.html"
  end

  #post "/create_user" do
   # @new_user= User.create(name: params[:name], email: #params[:email], password: params[:password])
    #post '/sessions'
    #end
  
end
