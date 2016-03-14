class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, only: [:show, :index, :filter, :send_message_to_user, :update, :get_match_array, :get_match_score  ]


  def index
  #  @users = User.all
  #  @users = User.order('created_at DESC').paginate(page: params[:page], per_page: 30)
  #  @users.filtered_by_age(min: 25, max: 52)
   @users = User.get_match_array(current_user)
  end

  def filter
     array_a = []
     array_b = []
     array_a = User.filtered_by_age_one(params[:min], params[:max])#.filtered_by_age_two(params[:min_two], params[:max_two])
  puts "-"*50
     p array_a
  puts "-"*50

  #    array_b = User.filtered_by_age_two(params[:min_two], params[:max_two])
  # puts "$"*50
  #    p array_b
  # puts "$"*50

    #  @array.flatten!
    # dup = array.select{|element| array.count(element) > 1 }
    # dup.uniq!
      puts "*"*50
      p array_c = array_a + array_b
      puts "*"*50

  puts "/"*50
    @users = User.filtered_by_age_one(params[:min], params[:max]).filtered_by_age_two(params[:min_two], params[:max_two])
    p @users
  puts "/"*50
    #p filtered_users
    render "index"
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

  # def age
  #   now = Time.now.utc.to_date
  #   now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  # end

  def update

    #now = Time.now.utc
    #p "hi thereeeee"
    #@user = User.new

    # ponebyear = @user.
    # ponebmonth
    # ponebday
    # ptwobyear
    # ptwobmonth
    # ptwobday
    ###p "$$$"*50
    ###p now.year
    ###p "HERE PARAMS #{params}"
    ###p @user.birthday_one
    ###p @user.birthday_two
  #  @user.age_one = (now.year - @user.ponebyear.to_i - ((now.month > @user.ponebmonth.to_i || (now.month == @user.ponebmonth.to_i && now.day >= @user.ponebday.to_i)) ? 0 : 1))
  #  @user.age_two = (now.year - @user.ptwobyear.to_i - ((now.month > @user.ptwobmonth.to_i || (now.month == @user.ptwobmonth.to_i && now.day >= @user.ptwobday.to_i)) ? 0 : 1))

    if @user.birthday_one == nil
      @user.birthday_one = params[:user][:birthday_one]
      @user.birthday_two = params[:user][:birthday_two]

      today = Date.today
      @user.age_one = today.year - @user.birthday_one.year
      @user.age_one -= 1 if @user.birthday_one.strftime("%m%d").to_i > today.strftime("%m%d").to_i

      @user.age_two = today.year - @user.birthday_two.year
      @user.age_two -= 1 if @user.birthday_two.strftime("%m%d").to_i > today.strftime("%m%d").to_i
    end

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



 #
 #  def get_match_array
 #   array_of_arrays = []
 #   @users.all.each do |user|
 #     score = get_match_score(@current_user, user)
 #     user_score = [user, score]
 #     array_of_arrays << user_score
 #   end
 #   return array_of_arrays.sort{|a, b| b[1] <=> a[1]}
 # end
 #
 #
 #
 #
 # def get_match_score(current_user, user)
 #
 #   current_user_array = []
 #   user_array = []
 #
 #   user.attributes.each do |key, value|
 #     # if value.respond_to? :boolean
 #      if value == nil
 #        user_array << ""
 #      else
 #       user_array << value  #need to downcase
 #     end
 #   end
 #
 #
 #
 #   @current_user.attributes.each do |key, value|  #current_user is placeholder
 #     if value == nil
 #       current_user_array << ""
 #     else
 #      current_user_array << value #need to downcase
 #    end
 #   end
 #
 #
 #
 #   count = 0
 #   current_user_array.zip(user_array).each do |user1, user2|
 #     if user1 && user2 == true
 #       count = count + 1
 #     end
 #   end
 #   return count
 #
 #
 # end






  def one_register
    @user = User.find(params[:id])
    # @user.birthday_one = params[:user][:birthday_one]
    # @user.birthday_two = params[:user][:birthday_two]
  #   respond_to do |format|
  #     if @user.update(user_params)
  #       format.html { redirect_to two_upload_photo_path, notice: 'User was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @user }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  render layout: "sign.html.erb"
  end

  def two_upload_photo
    @user = User.find(params[:id])
    render layout: "sign.html.erb"
  end

  def three_interests
    @user = User.find(params[:id])
    render layout: "sign.html.erb"
  end

  def four_moreinterests
    @user = User.find(params[:id])
    render layout: "sign.html.erb"
  end

  def five_aboutus
    @user = User.find(params[:id])
    render layout: "sign.html.erb"
  end

  def six_login
    @user = User.find(params[:id])
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
             :min,
             :max,
             :min_two,
             :max_two,
             :birthday_one,
             :birthday_two
              )
  end



end
