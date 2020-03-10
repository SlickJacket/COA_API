class AuthController < ApplicationController
    def login 
        user = User.find_by(email: params[:email])
        is_authenticated = user.authenticate(params[:password])
        if is_authenticated
            render json: {user: user, token: create_token(user.id)} 
        else
            render json: {errors: ['Wrong email or password']}, status: 422
        end
    end
end
