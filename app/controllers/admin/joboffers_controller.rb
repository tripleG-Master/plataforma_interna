class Admin::JoboffersController < ApplicationController
    before_action :authenticate_admin
    before_action :set_joboffer, only: %i[show edit update destroy]
    
    def index
        @joboffers = Joboffer.all
    end
    
    def new
        @joboffer = Joboffer.new
    end
    
    def show
        @applications = @joboffer.applications
    end
    
    def edit
    end

    def create
        @joboffer = Joboffer.new(joboffer_params)
        @joboffer.user_id = current_user.id
        @joboffer.salary = @joboffer.salary.to_s.gsub(/[^\d\.]/, '').to_f
    
        respond_to do |format|
            if @joboffer.save
                format.html { redirect_to @joboffer, notice: "Joboffer was successfully created." }
                format.json { render :show, status: :created, location: @joboffer }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @joboffer.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def update
        if @joboffer.update!(joboffer_params)
            redirect_to admin_joboffer_path(@joboffer), notice: 'Job offer was successfully updated.'
        else
            render :edit, alert: "Error updating job offer"    
        end
    end

    def destroy
        @joboffer.destroy!
    
        respond_to do |format|
          format.html { redirect_to admin_joboffers_path, status: :see_other, notice: "Joboffer was successfully destroyed." }
          format.json { head :no_content }
        end
      end
    
    private
    
    def set_joboffer
        @joboffer = Joboffer.find(params[:id])
    end

    def joboffer_params
        params.require(:joboffer).permit(:title, :description, :salary)
    end 
end