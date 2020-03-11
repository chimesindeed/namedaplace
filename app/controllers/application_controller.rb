require './config/environment.rb'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    redirect "/welcome"
  end
  
  get "/welcome" do
    erb :welcome
  end

  get "/register" do
    erb :register
  end

  get "/login" do
    "route good!"
  end

  post "/home"
    @user = User.new(name: params[:name], email: params[:email], password: params[:password]
  end
  
end
