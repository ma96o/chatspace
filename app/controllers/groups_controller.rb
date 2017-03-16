class GroupsController < ApplicationController
  def new ; end

  def create
    group = Group.create(group_params)
    redirect_to root_path
  end

  def edit ; end

  private
  def group_params
    params.require(:chat_group).permit(:name, user_ids: [])
  end
end
