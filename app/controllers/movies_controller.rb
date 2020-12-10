class MoviesController < ApplicationController
  skip_before_action :require_authenticated_user, only: [:index, :show]
  before_action :find_movie, only: [:show, :edit, :destroy, :update]
  
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
    @movie.reviews.build
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.reviews.first.user = current_user
    @movie.save ? (redirect_to movie_path(@movie)) : (render 'new')
  end

  def edit; end

  def update; end
  
  def show; end
  
  def destroy; end

  private

  def movie_params
    params.require(:movie).permit(:title, :rating, :runtime, :plot, :poster, reviews_attributes: [:rating, :content, :user_id])
  end

  def find_movie
    @movie = Movie.find_by_id(params[:id])
  end
end
