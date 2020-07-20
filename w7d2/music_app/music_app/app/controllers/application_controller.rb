class ApplicationController < ActionController::Base

    skip_before_action :verify_authenticity_token
    helper_method :current_user, :logged_in?, :login!

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token]) 
    end

    # options = { "font_size" => 10, "font_family" => "Arial" }
    # options[font_size] #=> 10

    # options = { font_size: 10, font_family: "Arial" }
    # options[:font_size] #=. 10

    def login!(user)
        session[:session_token] = user.reset_session_token!
    end
    
    def logged_in? 
        !!current_user 
        # return true if !current_user.nil?
        # false
    end

    def logout!
        @current_user.reset_session_token!
        session[:session_token] = nil
        @current_user = nil
    end

    def require_logged_in  
        redirect_to new_session_url if !logged_in?
    end

    def require_logged_out
        redirect_to users_url if logged_in?
    end
    
end
