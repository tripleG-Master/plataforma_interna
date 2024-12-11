class Admin::DashboardController < ApplicationController

  def index
    total_applications = Application.count
    total_job_offers = Joboffer.count
    @new_applications_count = Application.where(:status_new => true).count
    @average_applications =  total_job_offers.zero? ? 0 : (total_applications.to_f / total_job_offers)
    

  end
end
