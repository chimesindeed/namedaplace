require './config/environment.rb'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'

    enable :sessions
    set :session_secret, "amadeusamadeus"
  end
  
  get "/" do
    redirect "/welcome"
  end
  
  get "/welcome" do
    erb :"welcome.html"
  end

  get "/register" do
    erb :"sessions/register.html"
  end


  post "/home" do
    @user = User.create(name: params[:name], email: params[:email], password: params[:password])
    binding.pry
  end
  
end
