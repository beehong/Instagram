class PostsController < ApplicationController

	def index
		if current_user.customer?
			@post = Post.where(user_id: current_user.id)
			
		else
			@post = Post.all
		end
	end

	def new
		@post = Post.new
	end

	def create
		if current_user.customer?
		    @post = Post.new(post_params)
		    
		      if @post.save
		      redirect_to "/index", notice: 'Post was successfully created.' 
		       
		      else
		      redirect_to "/newpost" , notice: 'Something is wrong'
		      
		      end
		    
		end
	end

	def edit
		@post = Post.find(params[:id])
  		if current_user.id != @post.user_id
	        flash[:notice] 
	        return redirect_to "/index", notice:"Sorry. You are not allowed to perform this action."
      	end
	end

	def update
		if current_user.customer? || current_user.id == @post.user_id
			@post = Post.find(params[:id])

			if @post.update(post_params)
				redirect_to "/index", notice: 'Post was updated!'
			else
				redirect_to "/index", notice: 'Something is wrong!'
			end
		end

	end

	def destroy
	  	@post = Post.find(params[:id])

		  	if current_user.id == @post.user_id || current_user.admin?
		  	  @post.destroy
		  	  respond_to do |format|
		  	  format.js 
    		  format.html { redirect_to "/index", notice: 'Post was successfully destroyed.' }
	  		  format.json { head :no_content }
		   	  end
		    else
		  	  flash[:notice]
		  	  return redirect_to "/index",notice: 'Sorry. You are not allowed to perform this action'
   		    end
    end

    def like
    	@post = Post.find(params[:id])
		if Like.find_by(post_id: @post.id, user_id: current_user.id) ==nil
			@like = Like.create(post_id: @post.id, user_id: current_user.id)
		
		else
			@like = Like.find_by(post_id: @post.id, user_id: current_user.id)
			@like.delete
		end
		redirect_to "/index"
    end


	def post_params
      params.require(:post).permit(:caption,:user_id,image: [])
    end
end
