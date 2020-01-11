class Api::V1::MoviesController < ApplicationController
  def index
    @movies = Movie.all.map { |m| { id: m.id, title: m.title } }
    render json: @movies, status: :ok
  end

  def show
    @movie = Movie.find(params[:id])
    render json: { id: @movie.id, title: @movie.title }, status: :ok
  end
end
