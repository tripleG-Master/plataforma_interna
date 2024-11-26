class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :set_user_profile

  private

  def set_user_profile
    @user = current_user
    @applications = @user.applications
  end

  def authenticate_user
    unless user_signed_in?
      redirect_to new_user_session_path, alert: "You need to sign in or sign up to access this page"
    end
  end

  def authenticate_admin
    unless current_user&.admin?
      redirect_to root_path, alert: "You are not authorized to access this page. Only admin users can access this page"
    end
  end

end
