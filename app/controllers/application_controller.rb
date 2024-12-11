class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  protected
  
  def set_user_profile
    @user = current_user
    @applications = @user.present? ? @user&.applications : []
  end
  
  def applications
    @jobs = current_user.jobs
  end

  def authenticate_user
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def authenticate_admin
    unless current_user&.admin?
      redirect_to root_path, 
      alert: "You are not authorized to access this page. Only admin can access this page"
    end
  end
  
  def authenticate_owner
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to root_path, alert: "You are not authorized to edit this profile."
    end
  end

end
