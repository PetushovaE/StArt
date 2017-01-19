class CommentsController < ApplicationController

	def index
		@comments = Comment.all
	end

	def show
		@comment = Comment.find_by(id: params[:id])
	end

	def new
		@exhibition = Exhibition.find_by(id: params[:id])
		@comment = Comment.new
	end

	def create
		@comment = current_user.comments.build(comment_params)
		if @comment.save
			flash[:success] = "Your comment was successfully added"
			# redirect_to @exhibition
			redirect_to user_path(current_user)
		else
			# binding.pry
			@comment.errors.messages[:content].each do |message|
				flash[:success] = message 
			end
			render :new
		end
	end

	def update
		@comment = Comment.new(comment_params)
		if @comment.update(comment_params)
			redirect_to redirect_to exhibitions_path, :notice => "Your Comment has been updated."
		else
			render :edit
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

