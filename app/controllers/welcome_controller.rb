class WelcomeController < ApplicationController
	def home

		@latest_comments = Comment.last(5)


	end

	def about
	end
end
