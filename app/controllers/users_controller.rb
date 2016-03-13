class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index

    render json: params
    # include_only [:zipcode, :address, etc...]
    #  @users = User.all
    @users = User.order('created_at DESC').paginate(page: params[:page], per_page: 30)
    #  @suggestions = User.get_match_array()

    #@suggestions = User.get_match_array()
  end



  def new
    @user = User.new
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def send_message_to_user
    p params
    #  recipients = User.where(id: conversation_params[:recipients])
     recipients = User.where(id: (params["conversation"]["user_id"]).to_i)
     conversation = current_user.send_message(recipients, params["conversation"][:body], params["conversation"][:subject]).conversation
     flash[:success] = "Your message was successfully sent!"
    #  redirect_to conversation_path(conversation)
     redirect_to :back
  end

  def update

    # address = "#{params[:user][:street_number]}%20#{params[:user][:street]}%20#{params[:user][:city]}%20#{params[:user][:state]}%20#{params[:user][:country_location]}%20#{params[:user][:zip_code]}"
    # url = "http://maps.googleapis.com/maps/api/geocode/json?address="+address+"&key="
    #
    # response = HTTParty.get(url)
    #
    #
    # @user.latitude = response['results'][0]['geometry']['location']['lat']
    # @user.longitude = response['results'][0]['geometry']['location']['lng']




    respond_to do |format|
      if @user.update(user_params)
        if params[:redirect_location] == 'two_upload_photo'
          format.html { redirect_to two_upload_photo_path(@user), notice: 'User was successfully updated.' }
          format.json { render :two_upload_photo, status: :ok, location: @user }
        elsif params[:redirect_location] == 'three_interests'
          format.html { redirect_to three_interests_path(@user), notice: 'User was successfully updated.' }
          format.json { render :three_interests, status: :ok, location: @user }
        elsif params[:redirect_location] == 'four_moreinterests'
          format.html { redirect_to four_moreinterests_path(@user), notice: 'User was successfully updated.' }
          format.json { render :four_moreinterests, status: :ok, location: @user }
        elsif params[:redirect_location] == 'five_aboutus'
          format.html { redirect_to five_aboutus_path(@user), notice: 'User was successfully updated.' }
          format.json { render :five_aboutus, status: :ok, location: @user }
        else params[:redirect_location] == 'six_login'
          format.html { redirect_to users_path, notice: 'User was successfully updated.' }
          format.json { render :users, status: :ok, location: @user }
        end
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
      redirect_to one_register_path(@user), notice: "Welcome to Couplr!"
    else
      flash[:danger] = 'Passwords don\'t match'
      render "new"
    end
  end

  def one_register
    @user = User.find(params[:id])
  #   respond_to do |format|
  #     if @user.update(user_params)
  #       format.html { redirect_to two_upload_photo_path, notice: 'User was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @user }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  end

  def two_upload_photo
    @user = User.find(params[:id])
  end

  def three_interests
    @user = User.find(params[:id])
  end

  def four_moreinterests
    @user = User.find(params[:id])
  end

  def five_aboutus
    @user = User.find(params[:id])
  end

  def six_login
    @user = User.find(params[:id])
  end


  def get_match_array
    # @suggestions = User.get_match_array()
    # @suggestions = User.get_match_array()

  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.
      require(:user).
      permit(
             :username,
             :password,
             :password_confirmation,
             :avatar,
             :email,
             :partner_one_name,
             :partner_two_name,
             :ponebmonth,
             :ponebday,
             :ponebyear,
             :ptwobmonth,
             :ptwobday,
             :ptwobyear,
             :relationship_status,
             :we_are_a,
             :we_are_looking_for,
             :street_number,
             :street,
             :city,
             :state,
             :country_location,
             :zip_code,
             :have_kids,
             :avatar,
             :action,
             :adventure,
             :animation,
             :comedy,
             :documentary,
             :drama,
             :family,
             :horror,
             :musical,
             :mystery,
             :romance,
             :scifi,
             :western,
             :blues,
             :country,
             :disco,
             :electronic,
             :hiphop,
             :jazz,
             :latin,
             :pop,
             :rnb,
             :rap,
             :rock,
             :topforty,
             :african,
             :american,
             :asian,
             :coffee,
             :european,
             :mexican,
             :southamerican,
             :willeatanything,
             :wine,
             :amusementparks,
             :artgalleries,
             :bars,
             :comedyevents,
             :concerts,
             :conventions,
             :dancing,
             :exhibits,
             :festivals,
             :livemusic,
             :lounges,
             :movies,
             :museums,
             :nightclubs,
             :performingarts,
             :theatre,
             :dogs,
             :cats,
             :birds,
             :reptiles,
             :fish,
             :badmitten,
             :baseball,
             :basketball,
             :camping,
             :cycling,
             :fishing,
             :fitness,
             :football,
             :gardening,
             :golf,
             :gym,
             :hiking,
             :hockey,
             :hunting,
             :kayaking,
             :paddleboarding,
             :picnics,
             :running,
             :ski,
             :snowboard,
             :soccer,
             :swimming,
             :tennis,
             :walking,
             :communityservices,
             :earlybirds,
             :environments,
             :geeksandnerds,
             :localpolitics,
             :nightowls,
             :paleo,
             :vegan,
             :vegetarian,
             :philanthropy,
             :volunteer,
             :artist,
             :artsandcrafts,
             :billiards,
             :boardgames,
             :boats,
             :books,
             :cars,
             :cooking,
             :fashion,
             :kidsplaydates,
             :learningandclasses,
             :musician,
             :parenting,
             :photography,
             :politics,
             :traveling,
             :videogames,
             :smoking,
             :about_us,
             :ideal_friends,
             :latitude,
             :longitude
              )
  end



end
