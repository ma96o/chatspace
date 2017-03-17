class GroupsController < ApplicationController
  before_action :set_group, only: %i(edit update)

  def new
    @group = Group.new
  end

  def create
    group = Group.new(group_params)
    if group.save
      flash.now[:notice] = "グループを作成しました"
      render "messages/index"
    else
      flash.now[:alert] = "グループ作成に失敗しました"
      render "new"
    end
  end

  def edit ; end

  def update
    if @group.update(group_params)
      flash.now[:notice] = "グループを編集しました"
      render "messages/index"
    else
      flash.now[:alert] = "グループ編集に失敗しました"
      render "edit"
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
