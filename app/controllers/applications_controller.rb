class ApplicationsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @applications = current_user.applications

  end
  
  def create
    @joboffer = Joboffer.find(params[:joboffer_id])
    @application = @joboffer.applications.build(user: current_user)

    if @application.save
      redirect_to @joboffer, notice: 'Te has postulado con éxito.'
    else
      redirect_to @joboffer, alert: 'Error al postularse.'
    end
  end


end
