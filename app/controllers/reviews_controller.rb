class ReviewsController < ApplicationController
	before_action :authenticate_user!

	def create
		@review = current_user.reviews.create(review_params)
		redirect_to @review.tournament
		flash[:notice] = 'Thank you for your review!'
	end

	def destroy
		@review = Review.find(params[:id])
		tournament = @review.tournament
		@review.destroy
		redirect_to tournament
		flash[:notice] = 'Your review was successfully deleted.'
	end

	private
	
		def review_params
			params.require(:review).permit(:comment, :star, :tournament_id)
		end

end
