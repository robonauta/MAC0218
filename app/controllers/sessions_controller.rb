class SessionsController < ApplicationController
  def new
    
  end

  def create
    user = User.find_by(email: params[:email])
    p params[:user :email]
    # If the user exists AND the password entered is correct.
#    if (@user && @user.authenticate(params[:password]))
    if (user)
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      p "achei o usuário"
      redirect_to '/'
    else
    # If user's login doesn't work, send them back to the login form.
      p "nao achei"
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
  
end
