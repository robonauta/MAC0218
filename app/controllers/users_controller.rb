class UsersController < ApplicationController
  def new
    @user = User.new 
  end
  def create
#    render plain: params[:user].inspect
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

  def account
    @user = User.find(session[:user_id])
  end

  def account_update
    oldp = session[:old_password]
    @user = User.find(session[:user_id])
    if (!@user.password.equal? "" and oldp.equal? @user.password)
      
    else
      render 'settings'
    end
  end
  def update
    @user = User.find(session[:user_id])
    if(@user.update(user_params))
      redirect_to @user
    else
      render 'edit'
    end
  end
  
end
