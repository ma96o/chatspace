class MessagesController < ApplicationController
  def index
    @groups = Group.all
    @group = Group.find(params[:group_id])
    @messages = @group.messages
    @message = Message.new
  end

  def create
    message = Message.new(message_params)
    if message.save
      flash.now[:notice] = "メッセージを送信しました"
      redirect_to group_messages_path
    else
      flash.now[:alert] = "メッセージの送信に失敗しました"
      render "index"
    end
  end

  private

  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, group_id: params[:group_id])
  end
end
