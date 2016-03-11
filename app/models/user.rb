class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  has_secure_password
  has_many :images

  acts_as_messageable

  def mailboxer_username
    self.username
  end

  def mailboxer_email(object)
    self.email
  end



# return a 2-dem array, sort it, and return top 5

  def self.get_match_array()
    array_of_arrays = []
    self.all.each do |user|
      score = self.get_match_score(current_user, user)
      user_score = [user, score]
      array_of_arrays << user_score
    end
    return array_of_arrays.sort{|a, b| b[1] <=> a[1]}
  end




  def self.get_match_score(current_user, user)

    current_user_array = []
    user_array = []

    current_user.attributes.each do |key, value|  #current_user is placeholder
      if value == nil
        current_user_array << ""
      else
       current_user_array << value.downcase
     end
    end

    user.attributes.each do |key, value|
      # if key.respond_to? :boolean#current_user is placeholder
      if value == nil
        user_array << ""
      else
       user_array << value.downcase
     end
    end



    count = 0
    current_user_array.zip(user_array).each do |user1, user2|
      if user1 && user2 == true
        count = count + 1
      end
    end
    return count


  end





end
