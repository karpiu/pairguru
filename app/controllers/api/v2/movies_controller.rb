class Api::V2::MoviesController < ApplicationController
  def index
    @movies = Movie.all_with_genre
    render json: @movies, status: :ok
  end

  def show
    @movie = Movie.find(params[:id]).with_genre
    render json: @movie, status: :ok
  end
end
