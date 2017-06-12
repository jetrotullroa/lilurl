class RegistrationsController < Devise::RegistrationsController

  private

    # Modified Devise params for user login
    def sign_up_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :username, :company)
    end

    def account_update_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :username, :company)
    end

end
