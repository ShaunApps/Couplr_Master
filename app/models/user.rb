class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  has_secure_password
  has_many :images
  # scope :filtered_by_age_one, -> (min, max) {where ("(age_one >= #{min} AND age_one <= #{max})")}
  # scope :filtered_by_age_two, -> (min, max) {where ("(age_two >= #{min} AND age_two <= #{max})")}
  validates :partner_one_name, length: {minimum: 2, maximum: 20}, allow_blank: false
  validates :partner_two_name, length: {minimum: 2, maximum: 20}, allow_blank: false
  validates :username, length: {minimum: 2, maximum: 20}, allow_blank: false
  validates :email, length: {minimum: 2, maximum: 50}, allow_blank: false
  validates_uniqueness_of :username, :email

  # validates :birthday_one, presence: true
  # validates :birthday_two, presence: true
  validates_presence_of :birthday_one, :on => [:update], allow_nil: false
  validates_presence_of :birthday_two, :on => [:update], allow_nil: false

  def self.filtered_by_age(min1, max1, min2, max2)
    users = Arel::Table.new(:users)
    age_one_one_query = users[:age_one].gteq(min1).and(users[:age_one].lteq(max1))
    age_two_two_query = users[:age_two].gteq(min2).and(users[:age_two].lteq(max2))
    pair1_query = age_one_one_query.and(age_two_two_query)

    age_one_two_query = users[:age_one].gteq(min2).and(users[:age_one].lteq(max2))
    age_two_one_query = users[:age_two].gteq(min1).and(users[:age_two].lteq(max1))
    pair2_query = age_one_two_query.and(age_two_one_query)

    users = User.find_by_sql(users.where(pair1_query.or(pair2_query)).project(Arel.sql('id')).to_sql)
    User.where(id: users.map(&:id))
  end


  acts_as_messageable

  def mailboxer_username
    self.username
  end

  def mailboxer_email(object)
    self.email
  end


  def self.get_match_array(current_user)
   array_of_arrays = []
   self.all.each do |user|
     score = self.get_match_score(current_user, user)
     user_score = [user, score]
     array_of_arrays << user_score unless user == current_user
   end
     unmapped_array = array_of_arrays.sort{|a, b| b[1] <=> a[1]}
     return unmapped_array.map{ |user| user[0] }

 end




 def self.get_match_score(current_user, user)

   current_user_array = []
   user_array = []



   user.attributes.each do |key, value|
     # if value.respond_to? :boolean
      if value == nil
        user_array << ""
      else
       user_array << value  #need to downcase
     end
   end



   current_user.attributes.each do |key, value|  #current_user is placeholder
     if value == nil
       current_user_array << ""
     else
      current_user_array << value #need to downcase
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


def self.get_distance(current_user)
  array_of_distances =[]
  self.all.each do |user|
    distance = Geocoder::Calculations.distance_between([current_user.lat, current_user.lng], [user.lat, user.lng])
    user_distance = [user, distance]
    array_of_distances << user_distance
  end
  return array_of_distances

end

def self.user_distance(current_user, distance_in_miles)
  users_within_distance = get_distance(current_user).select {|userdistance| userdistance.last < distance_in_miles}
  users_within_distance.map{ |user| user[0] }
end






end
