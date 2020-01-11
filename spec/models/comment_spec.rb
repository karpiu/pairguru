require "rails_helper"

describe Comment do
  let(:movie) { create(:movie) }
  let(:user) { create(:user) }

  it 'validates uniqueness of user' do
  	create(:comment, user: user, movie: movie)
  	expect{create(:comment, user: user, movie: movie)}.to raise_error(ActiveRecord::RecordInvalid)
  end
end
