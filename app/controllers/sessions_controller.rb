class SessionsController < ApplicationController

  post '/sessions' do
    login(params[:email], params[:password])
    
  end

end
