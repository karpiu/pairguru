require "rails_helper"

describe "Genres requests", type: :request do
  let!(:genres) { create_list(:genre, 5, :with_movies) }

  before :each do
  	allow_any_instance_of(MovieDetails).to receive(:call).and_return({ :plot=>"A nice plot", :rating=>"9.0", :image_url=>"/sample.jpg" })
  end

  describe "genre list" do
    it "displays only related movies" do
      visit "/genres/" + genres.sample.id.to_s + "/movies"
      expect(page).to have_selector("table tr", count: 5)
    end
  end
end
