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
    "route good!"
  end

  get "/login" do
    "route good!"
  end
  
end
