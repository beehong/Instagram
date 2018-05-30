class CommentsController < ApplicationController

	def new
    	@post = Post.find(params[:id])
    	@comment = Comment.new
    	
    end

    def create
		@post = Post.find(params[:id])

	    @comment = Comment.new(comment_params)
	    byebug
	    	if @comment.save
		      	redirect_to "/index" ,notice: 'Comment added.'
		    else
		        redirect_to "/index" ,notice: 'Sorry. Something wrong with your comment'
		    end
	 	 
    end

    def comment_params
      params.require(:comment).permit(:description,:user_id,:post_id)
    end

end