class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  has_secure_password
  has_many :images
  scope :filtered_by_age_one, -> (min, max) {where ("(age_one >= #{min} AND age_one <= #{max})")}
  scope :filtered_by_age_two, -> (min, max) {where ("(age_two >= #{min} AND age_two <= #{max})")}
  validates :partner_one_name, length: {minimum: 2, maximum: 20}, allow_blank: false
  validates :partner_two_name, length: {minimum: 2, maximum: 20}, allow_blank: false
  validates :username, length: {minimum: 2, maximum: 20}, allow_blank: false
  validates :email, length: {minimum: 2, maximum: 50}, allow_blank: false
  validates_uniqueness_of :username, :email

  # validates :birthday_one, presence: true
  # validates :birthday_two, presence: true
  validates_presence_of :birthday_one, :on => [:update], allow_nil: false
  validates_presence_of :birthday_two, :on => [:update], allow_nil: false



  acts_as_messageable

  def mailboxer_username
    self.username
  end

  def mailboxer_email(object)
    self.email
  end


 #  def self.get_match_array()
 #   array_of_arrays = []
 #   self.all.each do |user|
 #     score = self.get_match_score(@current_user, user)
 #     user_score = [user, score]
 #     array_of_arrays << user_score
 #   end
 #   return array_of_arrays.sort{|a, b| b[1] <=> a[1]}
 # end
 #
 #
 #
 #
 # def self.get_match_score(current_user, user)
 #
 #   current_user_array = []
 #   user_array = []
 #
 #
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
 #   current_user.attributes.each do |key, value|  #current_user is placeholder
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









end
