class UsersController < ApplicationController
    before_action :require_logged_in, only: [:destroy]

    before_action :require_logged_out, only: [:new, :create]

    def create 
        @user = User.new(user_params)
        if @user.save
            login!(@user)
            redirect_to users_url
        else 
            flash.now[:errors] = @user.errors.full_messages
            render :new 
        end 
    end 

    def show 
        @user = User.find_by(id: params[:id])
        render :show 
    end 

    def new
        @user = User.new 
        render :new 
    end 

    private 

    def user_params
        params.require(:user).permit(:email, :password_digest, :session_token)
    end 

end
