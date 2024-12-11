
class Admin::UsersController < ApplicationController
  before_action :update_user_params, only: [:update]
  before_action :user_params, only: [:create]

  def index
    @users = User.where(admin: false) # Obtiene todos los usuarios
  end

  def show
    @user = User.find(params[:id]) # Obtiene el usuario a mostrar

  end
  
  def new
    @user = User.new
  end

  def create
    # @user = User.new(user_params) # Crea un nuevo usuario con los parámetros permitidos
    @user = User.invite!(user_params) do |user|
      user.skip_invitation = false
    end

    if @user.errors.empty?
      UserMailer.registration_notification(@user).deliver_now
      redirect_to admin_users_path, notice: 'Register successfully' # Redirige si se guarda correctamente
    else
      render :new # Vuelve a mostrar el formulario si hay errores
    end
  end

  def edit
    @user = User.find(params[:id]) # Obtiene el usuario a editar
  end

  def update
    @user = User.find(params[:id]) # Asegúrate de que estás encontrando al usuario correctamente
  
    # Intenta actualizar el usuario sin requerir la contraseña
    if @user.update_without_password(user_params.except(:current_password))
      redirect_to admin_users_path, notice: 'Usuario actualizado exitosamente.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
      redirect_to admin_users_path, notice: 'Usuario eliminado exitosamente.' # Redirige a la lista de usuarios
  end

  

  private

  def user_params
    params.require(:user).permit(:name, :email) # Permite solo los parámetros necesarios
    # :profile_picture, :password, :password_confirmation
  end
  
  def update_user_params
    params.require(:user).permit(:name, :email, :profile_picture, :password, :password_confirmation, :current_password) # Permite solo los parámetros necesarios
  end

end