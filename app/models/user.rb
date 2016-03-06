class User < ActiveRecord::Base
  has_secure_password
  has_many :images

  acts_as_messageable

  def mailboxer_username
    self.username
  end

  def mailboxer_email(object)
    self.email
  end

end
