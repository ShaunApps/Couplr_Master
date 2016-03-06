class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
  end


  def create
    @user = User.new user_params

    if @user.save
      log_in @user
      redirect_to root_path, notice: "Welcome to Couplr!"

    else
      flash[:danger] = 'Passwords don\'t match'
      render action: 'new'
    end
  end



  private

  def user_params
    params.
      require(:user).
      permit(:username, :password, :password_confirmation)
  end



end
