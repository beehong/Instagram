class FollowsController <  ApplicationController


	def search
		if params[:query].present?
	     @username = User.search_user(params[:query])
	     @user = User.search_by_username(params[:query])
	    
		     respond_to do |format|
		        format.html
		        format.json {render json: @username}
		        format.js
		     end
	  	
	  	end
	  	
	end


	def follower
		@users = User.find(params[:id])
		if Following.find_by(user_id: current_user.id,following_user_id: @users.id)==nil
			@following = Following.create(user_id: current_user.id, following_user_id: @users.id)
			@follower = Follower.create(user_id: @users.id, follower_user_id:current_user.id)
			@follow = Follow.create(following_id: @following.id, follower_id: @follower.id)
		
			flash[:notice]
  			return redirect_to "/",notice: "Start following #{@users.username}"
		else
			@following = Following.find_by(user_id: current_user.id,following_user_id: @users.id)
			@following.delete
			@follower = Follower.find_by(user_id: @users.id,follower_user_id: current_user.id)
			@follower.delete
			@follow = Follow.find_by(following_id: @following.id, follower_id: @follower.id)
			@follow.delete
			flash[:notice]
  			return redirect_to "/",notice: "Nomore following #{@users.username}" 
		end
	end



end