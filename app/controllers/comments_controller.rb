class CommentsController < ApplicationController

	def index
		@comments = Comment.all
	end

	def show
		@comment = Comment.find_by(id: params[:id])
	end

	def new
	end

	def create
		@exhibition = Exhibition.find_by(id: params[:id])
		@comment = @exhibition.comments.build(content: params[:content], user_id: current_user.id)
		if @comment.save
			render json :@comment
		else
			flash[:alert] = "Your comment wasn't posted!"
			redirect_to exhibition_path(exhibition)
		end

		def destroy
			@exhibition = Exhibition.find_by(id: params[:id])
			@comment = @exhibition.comments.find_by(id: params[:id])
			@comment.destroy
			# redirect_to

		end

		private

		def comment_params
			params.require(:comment).permit(:user_id, :content, :exhibition_id)
		end
	end



end
