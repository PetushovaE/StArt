class CommentsController < ApplicationController

	def index
		@comments = Comment.all
	end

	def show
		@comment = Comment.find_by(id: params[:id])
	end

	def new
		@comment = Comment.new(user_id: current_user.id)
	end

	def create
		@comment = Comment.new(comment_params)
		if @comment.save
			redirect_to exhibitions_path, :notice => "Your comment was successfully added!"
		else
			render :new
		end
	end

	def destroy
		@exhibition = Exhibition.find_by(id: params[:id])
  	    @comment = @exhibition.comments.find_by(id: params[:id])
		@comment.destroy
		redirect_to exhibitions_path, :notice => "Your comment deleted!"
	end

	private

	def comment_params
		params.require(:comment).permit(:content, :user_id, :exhibition_id)
	end
end

