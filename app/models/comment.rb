class Comment < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user

  validate :unique_user

  private
  def unique_user
    if movie.comments.pluck(:user_id).include?(user_id)
      errors.add(:user_id, 'needs to be unique for this movie')
    end
  end
end
