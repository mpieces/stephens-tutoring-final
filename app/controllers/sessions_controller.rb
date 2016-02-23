class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      # then sign the user in and redirect to the user's show page
      sign_in user   # need to create this method
      # remember user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      # redirect_to user
      redirect_back_or user
    else
      # Creates an error message and re-render the signin form
      flash.now[:danger] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    log_out if signed_in?
    redirect_to root_url
  end

end
