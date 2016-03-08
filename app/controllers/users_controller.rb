class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
   # @users = User.all
   @users = User.order('created_at DESC').paginate(page: params[:page], per_page: 30)
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

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.
      require(:user).
      permit(:username, :password, :password_confirmation, :avatar)
  end



end
