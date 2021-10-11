class PagesController < ApplicationController
  def index
  end

  def show
  end

  def leaderboard
    @members = Member.all.order(points: :desc) # Shift to limit 10
  end
end
