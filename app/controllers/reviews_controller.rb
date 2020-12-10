class ReviewsController < ApplicationController
  before_action :find_review, only: [:edit, :update, :destroy]

  def new
    @review = Review.new
    @review.movie = Movie.find_by(id: params[:movie_id])
  end

  def create
    @review = Review.new(review_params)
    @review.movie_id = params[:movie_id]
    @review.user_id = current_user.id
    @review.save ? redirect_to movies_path : render 'new'
  end

  def edit; end

  def update
    @review.update(review_params) ? redirect_to user_path(@review.user) : render 'edit'
  end

  def destroy
    @review.delete
    redirect_to movies_path
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :user_id)
  end

  def find_review
    @review = Review.find_by_id(params[:id])
  end
end
