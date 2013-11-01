class CommentsController < ApplicationController
	before_action :set_blog_master, only: [:destroy]
 
  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
  	@comment = Comment.new(comment_params)
  	if @comment.save
  	   flash[:success] = "Comment was created successfully!"
       redirect_to post_master_path(session[:post_id])
    else
    	render 'new'
    end
  end

   def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to post_master_path(session[:post_id]) }
      format.json { head :no_content }
    end
end

private

 	def set_blog_master
      @comment = Comment.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:discription, :post_master_id, :user_id)
    end
end
