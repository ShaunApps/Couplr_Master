class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  has_secure_password
  has_many :images
  scope :filtered_by_age_one, -> (min, max) {where ("(age_one >= #{min} AND age_one <= #{max})")}
  scope :filtered_by_age_two, -> (min, max) {where ("(age_two >= #{min} AND age_two <= #{max})")}


  acts_as_messageable

  def mailboxer_username
    self.username
  end

  def mailboxer_email(object)
    self.email
  end

  # def self.filtered_by_age_one(opts = {})
  #    min = opts[:min]
  #    max = opts[:max]
  #    user = User.arel_table
  #
  #    if min && max
  #      self.where(:age_one => min..max) # || self.where(:age_two => min..max)
  #    elsif min && !max
  #      self.where(user[:age_one].gt(min)) # || self.where(user[:age_two].gt(min))
  #    elsif max && !min
  #      self.where(user[:age_one].lt(max)) # || self.where(user[:age_two].lt(max))
  #    else
  #      self.all
  #    end
  #
  #  end

  # def self.filtered_by_age_two(opts = {})
  #    min = opts[:min]
  #    max = opts[:max]
  #    user = User.arel_table
  #
  #    if min && max
  #      self.where(:age_two => min..max) # || self.where(:age_two => min..max)
  #    elsif min && !max
  #      self.where(user[:age_two].gt(min)) # || self.where(user[:age_two].gt(min))
  #    elsif max && !min
  #      self.where(user[:age_two].lt(max)) # || self.where(user[:age_two].lt(max))
  #    else
  #      self.all
  #    end
  #
  #  end

  # def self.filtered_by_age(opts = {})
  #    min = opts[:min]
  #    max = opts[:max]
  #    user = User.arel_table
  #
  #    if min && max
  #      self.where(:age_one => min..max)
  #    elsif min && max
  #      self.where(:age_two => min..max)
  #    elsif min && !max
  #      self.where(user[:age_one].gt(min))
  #    elsif min && !max
  #      self.where(user[:age_two].gt(min))
  #    elsif max && !min
  #      self.where(user[:age_one].lt(max))
  #    elsif max && !min
  #      self.where(user[:age_two].lt(max))
  #    else
  #      self.all
  #    end
  #
  #  end
  #
  #
  #  def self.age_filter(min = 18, max = 100)
  #
  #  end




end
