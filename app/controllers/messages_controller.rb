class MessagesController < ApplicationController
  def index
    if params[:user_id]
      friend = User.find(params[:user_id]) # メッセージを受け取るユーザ
      friend_messages = current_user.messages.where(user_id: params[:id])
      my_messages = friend.messages.where(user_id: current_user)
      @messages = my_messages.to_a.concat(friend_messages).sort! { |a, b| b[:created_at] <=> a[:created_at] }
    elsif params[:group_id]
      group = Group.find(params[:group_id])
      @messages = group.messages
    end
    @message = Message.new
  end

  def create
    if params[:user_id]
      friend = User.find(params[:user_id])
      message = friend.messages.new(message_params)
    elsif params[:group_id]
      group = Group.find(params[:group_id])
      message = group.messages.new(message_params)
    end

    if message.save
      redirect_to action: :index and return
    else
      flash.now[:alert] = "メッセージの送信に失敗しました"
      render "index" and return
    end
  end

  private

  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id)
  end
end
