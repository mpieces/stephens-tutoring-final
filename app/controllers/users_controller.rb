class UsersController < ApplicationController
  # before_filter :signed_in_user, only: [:edit, :update]
  # before_filter :correct_user, only: [:edit, :update]


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user    # added after sessions created
      flash[:success] = "Welcome #{@user.first_name}!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
     # don't need this since the correct_user before filter defines @user
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      sign_in(@user)
      redirect_to @user
    else
      render 'edit'
    end
  end


  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :phone, :address, :city, :zip, :password, :password_confirmation)
    end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_path, notice: "Please sign in."
      end
    end

    # def correct_user
    #   @user = User.find(params[:id])
    #   redirect_to(root_path) unless current_user?(@user)  # defined in the Sessions helper module
    # end
end
