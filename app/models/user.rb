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


end
