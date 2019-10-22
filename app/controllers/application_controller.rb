class ApplicationController < ActionController::API
    include ActionController::HttpAuthentication::Token::ControllerMethods
    before_action :authenticate
    
    private
    # generates the token for front end
    def generate_token(user)
        key_base = Rails.application.credentials.secret_key_base
        payload = {user_id: user.id}
        JWT.encode(payload, key_base , 'HS256')
    end 

    def current_user
        @current_user ||= authenticate
    end 

    # validates token and returns the current user
    def authenticate
        #built in method w/JWT
        authenticate_or_request_with_http_token do |token|
            begin
                decoded = decode(token)
                @current_user = User.find_by(id: decoded[0]["user_id"]) 
            rescue JWT::DecodeError
                render json: {authorized: false }, status: 401  
            end
        end 
    end 

    def decode(token)
        key_base = Rails.application.credentials.secret_key_base
        JWT.decode(token, key_base, true, { algorithm: 'HS256' })
    end 
end
