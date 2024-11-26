class ApplicationsController < ApplicationController
  
  def create
    @joboffer = Joboffer.find(params[:joboffer_id])
    @application = @joboffer.applications.build(user: current_user)

    if @application.save
      redirect_to @joboffer, notice: 'Te has postulado con éxito.'
    else
      redirect_to @joboffer, alert: 'Error al postularse.'
    end
  end

  private

  def application_params
    params.require(:application).permit(:title, :description, :salary)
  end

end
