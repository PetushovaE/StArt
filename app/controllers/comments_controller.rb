class CommentsController < ApplicationController

	def index
		@comments = Comment.all
	end

	def show
		@comment = Comment.find_by(id: params[:id])
	end

	def new
		@comment = Comment.new
	end

	def create
		# @exhibition = Exhibition.find_by(id: params[:id])
		# byebug.pry
		@comment = Comment.new(comment_params)
		# 
		if @comment.save
			flash[:success] = 'Your comment was successfully added!'
			redirect_to exhibition_path(@comment.exhibition)
		else
			flash[:alert] = "Your comment wasn't posted!"
			# redirect_to exhibition_path(exhibition)
		end

		def destroy
			@exhibition = Exhibition.find_by(id: params[:id])
			@comment = @exhibition.comments.find_by(id: params[:id])
			@comment.destroy
			# redirect_to

		end

		private

		def comment_params
			params.require(:comment).permit(:content, :user_id)
			# , :exhibition_id
		end
	end



end
