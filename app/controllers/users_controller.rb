class UsersController < ApplicationController

  def new
  end

  def create
    User.create(params[:user_params])
  end

  def show
    @user = User.find(params[:id])
  end


  private

    def user_params
      params.require(:email).permit(:first_name, :last_name, :phone, :address, :city, :zip, :password, :password_confirmation)
    end
end
