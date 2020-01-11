require "rails_helper"

describe MovieDetails do
  subject { MovieDetails.new }
  let(:stub_data) {
    {
      "data": {
        "id": "7",
        "type": "movie",
        "attributes": {
          "title": "The Title",
          "plot": "A nice plot",
          "rating": 9.0,
          "poster": "/sample.jpg"
        }
      }
    }.to_json
  }

  it 'should return data' do
    subject.stub_chain(:open, :read) { stub_data }
    expect(subject.call("The Title")).to eq({ :plot=>"A nice plot", :rating=>"9.0", :image_url=>"/sample.jpg" })
  end
end
