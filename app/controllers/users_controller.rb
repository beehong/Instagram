class UsersController <  ApplicationController

	def new
		@user = User.new 
		
	end 

	def create
		
		@user = User.new(user_params)
		   
		    # store all emails in lowercase to avoid duplicates and case-sensitive login errors:
		    @user.email.downcase!
		    
		    if @user.save
		      # If user saves in the db successfully:
		      flash[:notice] = "Account created successfully!"
		      redirect_to root_path
		    else
		      # If user fails model validation - probably a bad password or duplicate email:
		      flash.now.alert = "Oops, couldn't create account. Please make sure you are using a valid email and password and try again."
		      render :new
		    end

	end

	def index
		@user = User.all
	end


	def search
	  if params[:query].present?
	     @username = User.search_user(params[:query])
	     @user = User.search_by_username(params[:query])

	     respond_to do |format|
	        format.html
	        format.json {render json: @username}
	        format.js
	     end
	  else
	    @user = User.all
	  end

	   
	end

	def destroy
    	@user = User.find(params[:id])

    		if current_user.role == "admin"
			  	@user.destroy
			  	  respond_to do |format|
			  	  format.js 
	    		  format.html { redirect_to "/admin_index", notice: 'User was successfully destroyed.' }
		  		  format.json { head :no_content }
			   	  end
		    else
			  	  flash[:notice]
			  	  return redirect_to "/admin_index",notice: 'Sorry. You are not allowed to perform this action'
   		    end
    end


	private

	  def user_params
	    # strong parameters - whitelist of allowed fields #=> permit(:name, :email, ...)
	    # that can be submitted by a form to the user model #=> require(:user)
	    params.require(:user).permit(:username, :email, :password,:gender,:profile_photo)
	  end






	



end