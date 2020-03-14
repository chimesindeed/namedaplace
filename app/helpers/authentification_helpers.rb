require_relative '../../config/environment.rb'
helpers do

  def login(email, password)
    
    user = User.find_by(:email => email)
   
    if user && user.autheticate(password)
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
    redirect to '/welcome'
  end
  
end
