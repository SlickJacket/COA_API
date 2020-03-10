class ApplicationController < ActionController::API
    def token
        # byebug
        request.headers["Authorization"].split(" ")[1]
    end
    
    def secret
        Rails.application.credentials[:jwt][:jwt_secret]
    end
    
    def decoded_token
        JWT.decode(token, secret, true, { algorithm: 'HS256' })
    end
    
    def current_user
        User.find(decoded_token[0]["user_id"])
    end
    
    def create_token(user_id)
        # byebug
        payload = { user_id: user_id }
        # byebug
        JWT.encode(payload, secret, 'HS256')
    end
end
