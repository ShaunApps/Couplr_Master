module MatchingHelper


def match_users(current_user_set, other_users_set)
    # the_hash = {:one => true, :two => false, :three => true, :four => false, :five => true, :six => true, :seven => false }


    #if the data set is a hash of key/value pairs, the below code will take the values and put into an array.
    # current_user_hash = User.current_user.params.all #make this a controller maybe?
    # other_user_hash = User.@user.params.all



    user_set = []
    the_hash.each do |key, value|
      if value == nil
        user_set << ""
      else
       user_set << value.downcase
    end
  end

    # user_set2 = [false, false, true, false, true, true, false]

    #
    # alex_array = [21,"ppp","$2a$10$zjIur..jgnANGnkVLQEiAe7CvXBYQCto8xak4YG7vbuRYrL9eJcGm","2016-03-10 00:38:33.992754","2016-03-10 00:40:25.852256","ppp",true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,"",true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,"","1","1","1","1","1","","","","headphones.jpg","ppp","ooo",1,1,1,1,1,1,"1","1","1","1",false,"1111",true]
    #
    # other_array = [22,"ttt","$2a$10$wBiLSxM7s0s51VwumfbTPOLG7kf2IlA2ARzWluZvDPcZ0QI30xR3.","2016-03-10 00:48:21.964146","2016-03-10 00:49:20.578717","ttt",true,true,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,"","4","4","4","4","4","","","","","ttt","yyy",2,4,4,4,4,4,"4","4","4","4",true,"123",true]
    #
    #this above arrays are test data


    count = 0
    alex_array.zip(other_array).each do |user1, user2|
      if user1 && user2 == true
        count = count + 1
      end
    end
    p count


  end







end
