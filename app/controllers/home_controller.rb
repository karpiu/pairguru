class HomeController < ApplicationController
  def welcome; end

  def top_commenters
    @commenters = User.joins(:comments)
                      .select('count(users.id) AS count, users.id AS id, users.email AS email')
                      .where('comments.created_at >= ?', 1.week.ago)
                      .group('id')
                      .limit(10)
                      .order('count DESC')
  end
end
