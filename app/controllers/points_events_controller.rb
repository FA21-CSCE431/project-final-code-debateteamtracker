# frozen_string_literal: true

# PointsEventsController
class PointsEventsController < ApplicationController
  before_action :set_points_event, only: %i[show edit update destroy]
  before_action :authenticate_admin!
  before_action :authenticate_permission

  def authenticate_permission
    redirect_to '/', alert: 'Not authorized. This email does not have admin permissions' unless Member.exists?([
                                                                                                                 'email LIKE ? AND priority = 3', "%#{current_admin.email}"
                                                                                                               ])
  end

  # GET /points_events or /points_events.json
  def index
    @points_events = PointsEvent.all
  end

  def find_members
    participation = Participation.all
    members = Member.all
    @points_events.each do |pe|
      temp = participation.where(points_event_id: pe.id)
      m = []
      temp.each do |t|
        m << members.find(t.member_id)
      end
      @points << m
    end
  end

  # GET /points_events/1 or /points_events/1.json
  def show
    @points_events = PointsEvent.all
    @points = []
    find_members
  end

  # GET /points_events/new
  def new
    @points_event = PointsEvent.new
    # Pass over collection of all members
    # @all_members = Member.all
    @all_members = Member.all
    # Pass over join table - assign points_events Foriegn Key automatically to join table
    @point_category = @points_event.participations.build
  end

  # GET /points_events/1/edit
  def edit
    @all_members = Member.all
  end

  # POST /points_events or /points_events.json
  def create
    @points_event = PointsEvent.new(points_event_params)

    # if empty, then build collection again
    params[:members][:id].each do |member|
      @points_event.participations.build(member_id: member) unless member.empty?
    end

    respond_to do |format|
      if @points_event.save
        format.html { redirect_to @points_event, notice: 'Points event was successfully created.' }
        format.json { render :show, status: :created, location: @points_event }
        tabulate
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @points_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /points_events/1 or /points_events/1.json
  def update
    respond_to do |format|
      if @points_event.update(points_event_params)
        format.html { redirect_to @points_event, notice: 'Points event was successfully updated.' }
        format.json { render :show, status: :ok, location: @points_event }
        tabulate
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @points_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /points_events/1 or /points_events/1.json
  def destroy
    Participation.destroy_by(points_event_id: @points_event.id)
    @points_event.destroy
    respond_to do |format|
      format.html { redirect_to points_events_url, notice: 'Points event was successfully destroyed.' }
      format.json { head :no_content }
      tabulate
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_points_event
    @points_event = PointsEvent.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def points_event_params
    params.require(:points_event).permit(:name, :value)
  end

  def tabulate
    @total_points_events = PointsEvent.all
    @total_members = Member.all
    @total_participations = Participation.all

    # Traverse through the list of members
    @total_members.each do |member|
      # Find participation id list where the points_event member id matches the member id in the member list
      participation_ids = @total_participations.where(member_id: member.id)
      points_events_ids = []

      # Get list of events attended for one member
      participation_ids.each do |p|
        # Look through the participation ids for a specific member
        temp = @total_points_events.where(id: p.points_event_id)
        unless temp.empty?
          points_events_ids << temp # Append temp to the list of points event ids
        end
      end

      sum = 0
      # Calculate sum of member's points
      points_events_ids.each do |p_event|
        sum += p_event[0].value
      end

      member.update_attribute(:points, sum)
    end
  end
end
