class SessionsController < ApplicationController

  post '/sessions' do
    login(params[:email], params[:password])
    erb :"/users/menu.html"
  end

end
