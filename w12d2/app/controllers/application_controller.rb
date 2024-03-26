class ApplicationController < ActionController::API
    include ActionController::RequestForgeryProtection #include module that includes CSRF protection
    before_action :snake_case_params #format keys before any controller actions!
    protect_from_forgery with: :exception

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token]) #session[:session_token] incoming data stored on session object.
    end

    def require_logged_in #no redirects!! just render errors.
        unless logged_in?
            render json: {errors: ['Must be logged in']}, status: 401
        end
    end

    def require_logged_out
        if logged_in?
            render json: {errors: ['Must be logged out']}, status: 401
        end
    end

    def log_in(user)
        session[:session_token] = user.reset_session_token
    end

    def logged_in?
        !!current_user
    end

    def log_out
        current_user.reset_session_token
        session[:session_token] = nil
        @current_user = nil
    end
    private
    def snake_case_params
        params.deep_transform_keys!(&.underscore) # frontend to backend case translation
    end

    def attach_auth_token #include auth token with form data. Rails automatically did that on non api apps. Need to do this ourselves in an api build.
        headers['X-CSRF-Token'] = form_authenticity_token
    end #gives front end the auth token so that information coming in from front end is validated.
    #alternatively, masked_authenticity_token(session) indicates that auth token is built from session token. functionally same.
end
