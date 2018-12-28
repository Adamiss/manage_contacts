class GroupsController < ApplicationController

  def index
    @groups = Group.all
    @contact_groups = ContactGroups.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(params.require(:group).permit(:name))
    if @group.save
      redirect_to groups_path
    else
      render 'new'
    end
  end

  def show
    @group = Group.find(params[:id])
    @contact_groups = ContactGroups.where(group_id:@group.to_s)
  end

end