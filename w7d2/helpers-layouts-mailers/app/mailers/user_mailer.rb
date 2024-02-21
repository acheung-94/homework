class UserMailer < ApplicationMailer

    def welcome_email(user)
        @user = user
        @url  = 'localhost:3000/'#???
        mail(to: user.username, subject: 'Welcome to My Awesome Site')
    end
end
