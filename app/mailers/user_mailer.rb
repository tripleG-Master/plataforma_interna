class UserMailer < ApplicationMailer

    default from: "no-reply@internalplatform.com"
    include Rails.application.routes.url_helpers
    
    def registration_notification(user)
        @user = user # Asigna el usuario a una variable de instancia
        @token = @user.invitation_token

        mail(to: @user.email, subject: "Welcome to Internal Platform") do |format|
            format.html { render 'registration_notification' } # Renderiza la vista correspondiente
          end
    end
    
end
