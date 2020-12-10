class MoviesController < ApplicationController
  before_action :find_movie, only: [:show, :edit, :destroy, :update]
  
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movie_path(@movie)
    else
      render 'new'
    end
  end

  def edit; end

  def update; end
  
  def show; end
  
  def destroy; end

  private

  def movie_params
    params.require(:movie).permit(:title, :rating, :runtime, :plot, :poster)
  end

  def find_movie
    @movie = Movie.find_by_id(params[:id])
  end
end
