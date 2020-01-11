require "rails_helper"

describe Movie do
  let(:movie) { create(:movie) }

  describe '#with_genre' do
    it 'returns information about a movie with genre' do
      expect(movie.with_genre).to eq({
        id: movie.id,
        title: movie.title,
        genre: {
          id: movie.genre.id,
          name: movie.genre.name,
          num_of_movies: movie.genre.movies.count
        }
      })      
    end
  end

  describe 'self#all_with_genre' do
    let!(:movies) { create_list(:movie, 5) }

    it 'returns a list of movies with genre information' do
      movies_with_genre = Movie.all_with_genre

      expect(movies_with_genre.count).to eq(5)
      expect(movies_with_genre.first[:genre]).not_to eq(nil)
    end
  end
end
