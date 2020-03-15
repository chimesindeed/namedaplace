require_relative '../../config/environment.rb'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'

    enable :sessions #needed for session authentification
    set :session_secret, "amadeusamadeus"

  end
  helpers do
  
    def login(email, password)
        
      user = User.find_by(:email => email)
    
      if user && user.authenticate(password)
        session[:email] = user.email #set session[:email] only if authenticated
      else redirect '/login'
      
      end

    end

    def current_user #to be used to ensure a user can only perform crud actions on their own places
      @user||= User.find_by(:email => session[:email]) if session[:email]
    end

    def logged_in?
      !!current_user #cool truthiness pattern  
    end

    def logout!
      session.clear
      redirect to '/'
    end

  end
  
  get '/' do
    erb :"/general/home.html"
  end
  
  get '/about' do
    erb :"/general/about.html"
  end
  
  get '/logout' do
    logout!
  end
end
