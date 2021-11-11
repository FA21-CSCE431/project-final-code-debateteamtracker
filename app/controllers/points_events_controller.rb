class PointsEventsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_points_event, only: %i[ show edit update destroy ]
  before_action :authenticate_permission

  def authenticate_permission
    redirect_to '/', alert: 'Not authorized. This email does not have admin permissions' unless Member.exists?(['email LIKE ? AND priority = 3', "%#{current_admin.email}"])
  end
  
  # GET /points_events or /points_events.json
  def index
    @points_events = PointsEvent.all
  end

  # GET /points_events/1 or /points_events/1.json
  def show
    @members = Member.all
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
  end

  # POST /points_events or /points_events.json
  def create
    @points_event = PointsEvent.new(points_event_params)

    # if empty, then build collection again
    params[:members][:id].each do |member|
      if !member.empty?
        @points_event.participations.build(:member_id => member)

      end
    end

    respond_to do |format|
      if @points_event.save
        format.html { redirect_to @points_event, notice: "Points event was successfully created." }
        format.json { render :show, status: :created, location: @points_event }
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
        format.html { redirect_to @points_event, notice: "Points event was successfully updated." }
        format.json { render :show, status: :ok, location: @points_event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @points_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /points_events/1 or /points_events/1.json
  def destroy
    @points_event.destroy
    respond_to do |format|
      format.html { redirect_to points_events_url, notice: "Points event was successfully destroyed." }
      format.json { head :no_content }
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

    # def tabulate

    # end
end
