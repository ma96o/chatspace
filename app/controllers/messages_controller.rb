class MessagesController < ApplicationController
  def index
    @messages = set_messages

    @message = Message.new
  end

  def create
    message = set_message

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

  def set_message
    if params[:user_id]
      parent = set_user
    elsif params[:group_id]
      parent = set_group
    end
    return parent.messages.new(message_params)
  end

  def set_messages
    if params[:user_id]
      friend = set_user # メッセージを受け取るユーザ
      friend_messages = current_user.messages.where(user_id: params[:id])
      my_messages = friend.messages.where(user_id: current_user)
      @messages = my_messages.to_a.concat(friend_messages).sort! { |a, b| b[:created_at] <=> a[:created_at] }
    elsif params[:group_id]
      group = set_group
      @messages = group.messages
    end
    return @messages
  end

  def set_user
    User.find(params[:user_id])
  end

  def set_group
    Group.find(params[:group_id])
  end
end
