class UsersController < ApplicationController

    def index
        users = User.all
        render json: users
    end

    def create
        user = User.new(params.require(:user).permit(:name, :email))
        if user.save #runs model level violation, should return false
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    def update
        user = User.find(params[:id])

        if user.update(params.require(:user).permit(:name, :email))
            redirect_to "/users/#{user.id}"
        else
            render json: user.errors.full_messages, status: 422
        end
    end
    
    def destroy
        user = User.find(params[:id])
        if user.destroy
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end
    
end

# http://localhost:3000/users?users[name]='Mary'&users[email]='mary@gmail.com'
# http://localhost:3000/users?name=daniel&email=daniel@gmail.com

