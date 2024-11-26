class Admin::UsersController < ApplicationController
  before_action :authenticate_admin # Asegúrate de que solo los administradores puedan acceder

  def index
    @users = User.all # Obtiene todos los usuarios
  end

  def show
    @user = User.find(params[:id]) # Obtiene el usuario a mostrar

  end
  
  def new
    @user = User.new # Inicializa un nuevo objeto User
  end

  def create
    @user = User.new(user_params) # Crea un nuevo usuario con los parámetros permitidos
    if @user.save
      redirect_to admin_users_path, notice: 'Usuario creado exitosamente.' # Redirige si se guarda correctamente
    else
      render :new # Vuelve a mostrar el formulario si hay errores
    end
  end

  def edit
    @user = User.find(params[:id]) # Obtiene el usuario a editar
  end

  def update
    @user = User.find(params[:id]) # Obtiene el usuario a editar
    if @user.update(update_user_params)
      redirect_to admin_users_path, notice: 'Usuario actualizado exitosamente.' # Redirige si se guarda correctamente
    else
      render :edit # Vuelve a mostrar el formulario si hay errores
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
      redirect_to admin_users_path, notice: 'Usuario eliminado exitosamente.' # Redirige a la lista de usuarios
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation) # Permite solo los parámetros necesarios
  end

  def update_user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password) # Permite solo los parámetros necesarios
  end

end