require 'rails_helper'

RSpec.describe User, :type => :model do
	context "validations" do
	
		##happy path
		describe "can be created when email, username and password are presents" do
			When(:user){User.create(
				email: "abc@gmail.com",
				username: "abc",
				password: "abc",
				)
			}
			
			Then {
				
				user.valid? == true
			}
		end

		##sad path
		describe "cannot be created without a email" do
			When(:user) {User.create(username: "abc",password: "abc") }
			Then { user.valid? == false }
		end

	end
   
	   	

	      
end



