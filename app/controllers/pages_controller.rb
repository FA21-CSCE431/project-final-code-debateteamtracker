class PagesController < ApplicationController
  def index
  end

  def show
  end

  def leaderboard
    # Show regular users and limit total to top 10
    @members = Member.where(priority: 1).order(points: :desc).limit(10)
  end
end
