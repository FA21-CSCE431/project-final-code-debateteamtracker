class PointsEventsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_points_event, only: %i[ show edit update destroy ]

  # GET /points_events or /points_events.json
  def index
    @points_events = PointsEvent.all
  end

  # GET /points_events/1 or /points_events/1.json
  def show
  end

  # GET /points_events/new
  def new
    @points_event = PointsEvent.new
  end

  # GET /points_events/1/edit
  def edit
  end

  # POST /points_events or /points_events.json
  def create
    @points_event = PointsEvent.new(points_event_params)

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
end
