class UsersController < ApplicationController

  def new
  end

  def create
    User.create(params[:user_params])
  end

  # def update


  private

    def user_params
      params.require(:email).permit(:first_name, :last_name, :phone, :address, :city, :zip, :password, :password_confirmation)
    end
end
