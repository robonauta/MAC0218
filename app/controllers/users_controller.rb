class UsersController < ApplicationController
  def new
    if current_user
      redirect_to '/account'
    end
    @user = User.new 
  end
  def create
    @user = User.new(user_params)
    @user.rank = "user"
    if(@user.save)
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end
  
  private def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :salt, :name, :organization, :rank)
  end

  def show
    @user = User.find(session[:user_id])
  end

  def settings
    @user = User.find(session[:user_id])
  end

  def edit
    @user = User.find(session[:user_id])
  end
  
  def update
    @user = User.find(session[:user_id])
    if(@user.update(user_params))
      redirect_to '/'
    else
      render 'account'
    end
  end
  
end
