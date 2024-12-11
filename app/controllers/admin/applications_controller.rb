class Admin::ApplicationsController < ApplicationController
    before_action :authenticate_admin
    before_action :set_application, only: %i[destroy]

    def index
        if params[:filter] == 'new'
            @applications = Application.where(status_new: true).order(:created_at)
        else
            @applications = Application.all.order(:created_at)
        end
    end

    def destroy
        @joboffer = @application.joboffer
        @application.destroy
        redirect_to admin_joboffer_path(@joboffer), notice: 'Application deleted successfully.'
    end
    
    def update_status
        @application = Application.find(params[:id])
        @application.update(status_new: false)    
        respond_to do |format|
            format.json { render json: { success: true, message: 'Status updated successfully' } }
        end
    end

    private

    def set_application 
        @application = Application.find(params[:id])
    end

end