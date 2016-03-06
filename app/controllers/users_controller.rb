class UsersController < ApplicationController

  def index
  end 

  def new
    @user = User.new
  end

  def show
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Welcome to Couplr!"

    else
      flash[:danger] = 'Passwords don\'t match'
      render "new"
    end
  end




  private

  def user_params
    params.
      require(:user).
      permit(:username, :password, :password_confirmation)
  end



end
