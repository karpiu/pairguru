# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  released_at :datetime
#  avatar      :string
#  genre_id    :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Movie < ApplicationRecord
  belongs_to :genre
  has_many :comments

  validates_with TitleBracketsValidator

  def self.all_with_genre
    genre_counts = {}
    Genre.joins(:movies).select('count(movies.id) as count, genres.id AS id, genres.name AS name').group('id').map do |g|
      genre_counts[g.id] = { count: g.count, name: g.name }
    end
    Movie.all.map do |movie|
      {
        id: movie.id,
        title: movie.title,
        genre: {
          id: movie.genre_id,
          name: genre_counts[movie.genre_id][:name],
          num_of_movies: genre_counts[movie.genre_id][:count]
        }
      }
    end
  end

  def with_genre
    {
      id: id,
      title: title,
      genre: {
        id: genre.id,
        name: genre.name,
        num_of_movies: genre.movies.count
      }
    }
  end
end
