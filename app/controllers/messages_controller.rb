class MessagesController < ApplicationController
  def index
    if params[:user_id]
      friend = User.find(params[:user_id]) # メッセージを受け取るユーザ
      friend_messages = current_user.messages.where(user_id: params[:id])
      my_messages = friend.messages.where(user_id: current_user)
      @messages = my_messages.to_a.concat(opp_messages).sort! { |a, b| b[:created_at] <=> a[:created_at] }
    elsif params[:group_id]
      group = Group.find(params[:group_id])
      @messages = group.messages
    end
    @message = Message.new
    @message.user_id = current_user
  end

  def create
    message = Message.new(message_params)
    if message.save
      redirect_to "index"
    else
      flash.now[:alert] = "メッセージの送信に失敗しました"
      render "index"
    end
  end

  private

  def message_params
    params.require(:message).permit(:text).merge(:user_id)
  end
end
