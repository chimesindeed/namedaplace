require_relative '../../config/environment.rb'
class SessionsController < ApplicationController

  post '/sessions' do
  binding.pry
  "before login is called"
    login(params[:email], params[:password])
    erb :"/users/menu.html"
  end

end
