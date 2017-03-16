class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    group = Group.new(group_params)
    if group.save
      flash.now[:notice] = "グループを作成しました"
      render "top/index"
    else
      flash.now[:alert] = "グループ作成に失敗しました"
      render "new"
    end
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
