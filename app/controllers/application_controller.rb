require './config/environment.rb'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'

    enable :sessions
    set :session_secret, "amadeusamadeus"
  end
  
  helpers do
    
    def logged_in?
      !!current_user
    end
    
    def current_user
      @user ||= User.find_by(:email => session[:email]) if session[:email]
    end
    
    def login(email, password)
      #check if a user with this email actually exits
      #if so, set the session
      #otherwise redirect
      user = User.find_by(:email => email)
      if user && user.authenticate(password)
        session[:email] = user.email
      else redirect '/login'
      end
    end
    
    def logout!
      redirect '/welcome'
    end
    
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
