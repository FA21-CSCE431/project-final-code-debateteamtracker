class GroupsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_group, only: %i[ show edit update destroy ]
  before_action :authenticate_permission

  def authenticate_permission
    redirect_to '/', alert: 'Not authorized. This email does not have admin permissions' unless Member.exists?(['email LIKE ? AND priority = 3', "%#{current_admin.email}"])
  end

  # GET /groups or /groups.json
  def index
    @groups = Group.all
  end

  def findMembers
    @member_groups = []
    memberGroup = MemberGroup.all
    members = Member.all
    @groups.each do |group|
      temp = memberGroup.where(group_id: group.id)
      m = []
      temp.each do |t|
        m << members.find(t.member_id)
      end
      @member_groups << m
    end
  end

  # GET /groups/1 or /groups/1.json
  def show
    @groups = Group.all
    @member_groups = MemberGroup.where(group_id: params[:id])
    @members = Member.all
  end

  # GET /groups/new
  def new
    @group = Group.new
    @all_members = Member.all
    @group_member_join = @group.member_groups.build
  end

  # GET /groups/1/edit
  def edit
    @all_members = Member.all
  end

  # POST /groups or /groups.json
  def create
    @group = Group.new(group_params)
    params[:members][:id].each do |member|
      if !member.empty?
        @group.member_groups.build(:member_id =>member)
      end
    end
    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: "Group was successfully created." }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    params[:members][:id].each do |member|
      if !member.empty?
        @group.member_groups.build(:member_id =>member)
      end
    end
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: "Group was successfully updated." }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    #@members = Member.all
    MemberGroup.destroy_by(group_id: @group.id)
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: "Group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_params
      params.require(:group).permit(:title)
    end
end
