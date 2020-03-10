class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]

    def index
        @users = User.all
        render json: @users
      end
    
      def profile
        render json: current_user, include: [:first_name, :last_name, :email, :phone_number, :admin]
      end
    
      def show
        render json: @user, include: [:first_name, :last_name, :email, :phone_number, :admin]
      end
    
      def create
        user = User.create(user_params)
        # byebug
        if user.valid?
          # byebug
          # render json: { user: @user, jwt: @token }, status: :created
          render json: {user: user, token: create_token(user.id)}
        else
          # byebug
          # render json: { error: 'failed to create user' }, status: :not_acceptable
          render json: {errors: user.errors.full_messages}, status: 422
        end
      end
    
      def update
        if @user.update(user_params)
          render json: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end
    
      def destroy
        @user.destroy
      end
     
      private
      def user_params
        params.permit(:first_name, :last_name, :email, :password, :bio, :profile_img, :cover_img, :phone_number, :admin )
      end

      def set_user
        @user = User.find(params[:id])
      end
end
