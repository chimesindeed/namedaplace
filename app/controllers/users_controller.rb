class UsersController < ApplicationController
  
  get '/signup' do #display signup form
    erb :"users/new.html"
  end
  
   get '/login' do
    erb :"login/login.html"
  end
  
  post '/users' do
    @user = User.new
    @user.email = params[:email]
    @user.password = params[:password]
    
      #if email considered valid by regex check in model and uniquness
      if @user.save
        #send to login page to login
        redirect '/login'
      else
        #present same signup form to try again
        erb:"users/new.html"
      end
  end
  
end
