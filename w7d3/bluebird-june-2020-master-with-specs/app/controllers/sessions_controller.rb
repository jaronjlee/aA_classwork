class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if user
      login!(user)
      redirect_to users_url
    else
      flash[:errors] = ["Invalid Credentials"]
      redirect_to new_session_url
    end
  end

  def destroy
    if logged_in?
      logout!
    end
    redirect_to new_session_url
  end
  
end