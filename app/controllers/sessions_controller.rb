class SessionsController < ApplicationController
  before_action

  def new
  end

  def show
  end

  def create
    @user = User.
    find_by(username: params[:username]) #.
    # try(:authenticate, params[:password])

    if @user && @user.authenticate(params[:password])
      # logged in, hooray
      session[:user_id] = @user.id
      redirect_to images_path, notice: "Logged In"
    else
      flash.now.alert = "Username and/or Password is Invalid"
      render "new"
    end
  end



  def destroy
  #  forget(current_user)
   session.delete(:user_id)
   @current_user = nil
   redirect_to root_url, notice: "Logged out"
  end

end
