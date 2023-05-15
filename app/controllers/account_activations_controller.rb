class AccountActivationsController < ApplicationController
  before_action :authenticate_user!
    def create
        user = User.find_by(email: params[:email])
        if user && !user.activated?
          user.send_activation_email
          render json: "Activation email sent. Please check your email."
        else
          render json: "Invalid email or already activated."
        end
    end
    def edit
        user = current_user
        if user && !user.activated? && user.authenticated?(:activation, params[:id])
          userr
          render json: { message: "Account activated!" }, status: :ok
        else
          render json: { error: "Invalid activation link" }, status: :unprocessable_entity
        end
      end
end
