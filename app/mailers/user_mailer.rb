class UserMailer < ApplicationMailer
    def account_activation(user)
      @user = user
      mail to: user.email, subject: "Activate your account", template_name: "account_activation"
    end
  end