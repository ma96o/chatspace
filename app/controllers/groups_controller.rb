class GroupsController < ApplicationController
  def new ; end

  def create
    group = Group.create(name: group_params[:name])
    group_params[:user_ids].map{ |user_id| group.users_groups.create(user_id: user_id) if user_id != "" }
    redirect_to root_path
  end

  def edit ; end

  private
  def group_params
    params.require(:chat_group).permit(:name, user_ids: [])
  end
end
