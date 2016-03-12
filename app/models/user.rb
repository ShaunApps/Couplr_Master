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

  def self.filtered_by_age(opts = {})
     min = opts[:min]
     max = opts[:max]
     user = User.arel_table

     if min && max
       self.where(:age_one => min..max) || self.where(:age_two => min..max)
     elsif min && !max
       self.where(user[:age_one].gt(min)) || self.where(user[:age_two].gt(min))
     elsif max && !min
       self.where(user[:age_one].lt(max)) || self.where(user[:age_two].lt(max))
     else
       self.all
     end

   end

end
