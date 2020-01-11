require "rails_helper"

describe "Comments requests", type: :request do
  let!(:movie) { create(:movie, :with_comments) }

  before :each do
    allow_any_instance_of(MovieDetails).to receive(:call).and_return({ :plot=>"A nice plot", :rating=>"9.0", :image_url=>"/sample.jpg" })
  end

  describe "comments list" do
    it "displays only related movies" do
      visit "/movies/#{movie.id}"
      expect(page).to have_selector(".comment", count: 5)
    end
  end
end
