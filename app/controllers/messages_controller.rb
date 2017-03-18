class MessagesController < ApplicationController
  before_action :set_groups, only: %i(index create)
  before_action :set_group, only: %i(index create)
  before_action :set_messages, only: %i(index create)

  def index
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to group_messages_path, notice: "メッセージを送信しました"
    else
      flash.now[:alert] = "メッセージの送信に失敗しました"
      render action: :index, alert: "メッセージの送信に失敗しました"
    end
  end

  private

  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, group_id: params[:group_id])
  end

  def set_groups
    @groups = current_user.groups
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_messages
    @messages = @group.messages
  end
end
