class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to '/account'
    end
  end

  def create
    authorized_user = User.authenticate(params[:user][:email], params[:user][:password])
    # If the user exists AND the password entered is correct.
    if (authorized_user)
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = authorized_user.id
      @current_user = authorized_user
      redirect_to '/'
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
  
end
