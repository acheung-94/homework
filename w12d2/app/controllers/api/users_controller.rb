class Api::UsersController < ApplicationController

    wrap_parameters include: User.attribute_names : ['password'] #allows nesting of password under :user key, in addition to :username by default.
    before_action :require_logged_out, only: [:create]
    def create
        @user = User.new(user_params)
        if @user.save
            log_in(@user)
            render :show
        else
            render json: @user.errors.full_messages, status: 422
        end
    end


    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end
