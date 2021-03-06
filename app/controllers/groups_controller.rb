class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    group = Group.new(group_params)
    group.users << current_user
    group.save
    redirect_to group
  end

  def show
    @group = Group.find(params[:id])
  end

  private

  def group_params
    params.
      require(:group).
      permit(:name, :description)
  end
end
