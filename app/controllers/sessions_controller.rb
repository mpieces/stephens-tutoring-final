class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      # then sign the user in and redirect to the user's show page
      sign_in user   # need to create this method
      # redirect_to user
      redirect_back_or user
    else
      # Creates an error message and re-render the signin form
      flash.now[:danger] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    # sign_out
    session[:user_id] = nil
    redirect_to root_url
  end

end
