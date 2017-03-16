class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    group = Group.new(group_params)
    redirect_to root_path and return if group.save
    flash.now[:alert] = "グループ作成に失敗しました"
    render "index"
  end

  def edit ; end

  private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
