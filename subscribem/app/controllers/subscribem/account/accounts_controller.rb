require_dependency "subscribem/application_controller"

module Subscribem
  class Account::AccountsController < ApplicationController
    before_filter :authenticate_user!
    before_filter :authorize_owner, only: [:edit, :update]

    def update
      if current_account.update_attributes(account_params)
        flash[:success] = "Account updated successfully."
        redirect_to root_path
      else
        flash[:error] = "Account could not be updated."
        render :edit
      end
    end

    private

    def account_params
      params.require(:account).permit(:name)
    end
  end
end