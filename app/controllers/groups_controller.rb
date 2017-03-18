class GroupsController < ApplicationController
  before_action :set_group, only: %i(edit update)

  def new
    @group = Group.new
  end

  def create
    group = Group.new(group_params)
    if group.save
      flash.now[:notice] = "グループを作成しました"
      redirect_to group_messages_path(group)
    else
      flash.now[:alert] = "グループ作成に失敗しました"
      render "new"
    end
  end

  def edit ; end

  def update
    if @group.update(group_params)
      redirect_to group_messages_path(@group), notice: "グループを編集しました"
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
