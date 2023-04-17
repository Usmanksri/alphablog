class ApplicationController < ActionController::Base


    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]

    end

    def logged_in?
        !!current_user
    end

    def require_user
        if !logged_in?
          flash[:notice] = "You must be logged in to perform that action"
          redirect_to login_path
        end
      end

      rescue_from CanCan::AccessDenied do |exception|
        redirect_to main_app.root_url, notice: exception.message
      end

end
