class MovieDecorator < Draper::Decorator
  delegate_all

  def cover
    MovieDetails::BASE_URL + details[:image_url]
  end

  def plot
  	details[:plot]
  end

  def rating
  	details[:rating]
  end

  private

  def details
  	@details ||= MovieDetails.new.call(object.title)
  end
end
