class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    group = Group.new(group_params)
    redirect_to :back, flash: { alert: "グループ生成に失敗しました" } and return if group.save
    render "top/index"
  end

  def edit ; end

  private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
