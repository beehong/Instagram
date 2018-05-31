require 'rails_helper'

RSpec.describe Follow, :type => :model do
	 

	    ##happy path
		describe "can be created when follower_id and following_id are presents" do
			When (:user){User.create(email: "abc@gmail.com", password: "nas")}
			When (:following){Following.create(following_user_id: 2, user_id: user.id)}
			When (:follower){Follower.create(follower_user_id: 1, user_id: user.id)}

			When(:follow){
				Follow.create(
					following_id: following.id,
					follower_id: follower.id,
				)
			}
			Then {
				
				follow.valid? == true
			}
		end

		##sad path
		describe "cannot be created without follower_id" do
			When (:user){User.create(email: "abc@gmail.com", password: "nas")}
			When (:following){Following.create(following_user_id: 2, user_id: user.id)}
			When(:follow) {Follow.create(following_id: following.id) }
			Then { follow.valid? == false }
		end
 	
		

	
   

	      
end