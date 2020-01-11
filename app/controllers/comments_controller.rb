class CommentsController < ApplicationController
  def create
    movie = Movie.find(params[:movie_id])
    comment = Comment.new(comment_params.merge!({ user_id: current_user.id, movie_id: movie.id }))
    if comment.save
      redirect_to movie, notice: 'Comment was successfully created.'
    else
      redirect_to movie
    end
  end

  def destroy
    movie = Movie.find(params[:movie_id])
    Comment.find(params[:id]).destroy
    redirect_to movie
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
