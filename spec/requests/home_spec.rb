require "rails_helper"

describe "Home requests", type: :request do
  let!(:movie) { create(:movie, :with_comments) }

  describe "#top_commenters" do
    it "displays top commenters list" do
      visit "/top_commenters"
      expect(page).to have_selector(".commentator", count: 5)
    end
  end
end
