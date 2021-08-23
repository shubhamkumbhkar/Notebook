class UserMailer < ApplicationMailer
    def new_user
        @user = params[:user]
        #byebug
        mail(to: @user.username, subject: 'Welcome')
    end
end