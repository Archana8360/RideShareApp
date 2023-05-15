# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :authenticate_user! ,only: %i[destroy ]
  respond_to :json



  # def destroy
  #   @user = current_user
  #   @user.destroy
  #   render json: "User Deleted"
  # end
  private

  def respond_with(resource, options={})
    if resource.persisted?
      render json: {
        status: {code: 200, message: 'Signed up successfully', data: resource}
      }, status: :ok
    else
      render json: {
        status: {message: 'User deleted or can not created successfully', errors: resource.errors.full_messages }
      }
    end
  end
end


