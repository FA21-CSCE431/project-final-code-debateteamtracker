# frozen_string_literal: true

# PagesController
class PagesController < ApplicationController
  def index
    @events = Event.order(start_time: :asc).limit(3)
    @homepages = Homepage.limit(1)
  end

  def show; end

  def leaderboard
    # Show regular users and limit total to top 10
    @members = Member.where(priority: 1).order(points: :desc).limit(10)
    @entries = []
    if !current_admin.nil? && Member.exists?(['email LIKE ? AND priority = 1', "%#{current_admin.email}"])
      @current = Member.where(email: current_admin.email).first

      @participation = Participation.where(member_id: @current.id)
      @events = PointsEvent.all

      @participation.each do |p|
        @entries << @events.find(p.points_event_id)
      end
    end
    # @current = Member.find(4)
  end
end
