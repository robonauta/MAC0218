class UsersController < ApplicationController
  # GET: SIGNUP
  def new
    # Tentativa de signup já logado redireciona
    if current_user
      redirect_to '/account'
    end
    @user = User.new 
  end
  
  # POST: SIGNUP
  def create
    @user = User.new(user_params)
    @user.rank = "user"
    
    # Salvou na DB? Guarda o user.id e redireciona pro index
    if(@user.save)
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end
  
  # GET: ACCOUNT (MOSTRAR PERFIL)
  def show
    # busca usuário na db
    @user = User.find(session[:user_id])
  end

  # GET: SETTINGS (EDITAR LOGIN/SENHA)
  def settings
    # busca usuário na db
    @user = User.find(session[:user_id])
  end

  # GET: EDIT (EDITAR PERFIL)
  def edit
    # busca usuário na db
    @user = User.find(session[:user_id])
  end
  
  # POST: UPDATE
  def update
    # busca usuário na db
    @user = User.find(session[:user_id])
    # salvou na db?
    if(@user.update(user_params))
      redirect_to '/'
    else
      render 'account'
    end
  end
  
  private def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :salt, :name, :organization, :rank)
  end

  
  
end
