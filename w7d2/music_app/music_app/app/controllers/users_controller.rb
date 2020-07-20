class UsersController < ApplicationController


    # before_action :require_logged_in, only: [:index] #only if you're logged in
    before_action :require_logged_out, only: [:new, :create] # if you're logged out

    # def index
    #     users = User.all
    #     render :index
    # end

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login!(@user)
            redirect_to users_url(@user)
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end     
    end

    private
    def user_params
        params.require(:user).permit(:email, :password)
    end

end
