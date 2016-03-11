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



#return a 2-dem array, sort it, and return top 5

  def self.get_match_array()
    self.all.each do |user|
      self.get_match_score(current_user, user)

  end




  def self.get_match_score(current_user, user)
    #
    user_set = []
    the_hash.each do |key, value|
      if value == nil
        user_set << ""
      else
       user_set << value.downcase
    end
  end


    count = 0
    alex_array.zip(other_array).each do |user1, user2|
      if user1 && user2 == true
        count = count + 1
      end
    end
    return count


   end


  end

end
