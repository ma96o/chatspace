class GroupsController < ApplicationController
  def new ; end

  def create
    group = Group.create(group_params)
    redirect_to root_path
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    group = Group.find(params[:id])
    redirect_to root_path and return if group.update(group_params)
    render 'edit'
  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
