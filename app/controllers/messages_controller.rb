class MessagesController < ApplicationController
  def index
    if params[:type] == "user"

      opponent = User.find(params[:id])
      opp_messages = current_user.messages.where(user_id: params[:id])
      my_messages = opponent.messages.where(user_id: current_user)
      @messages = my_messages.to_a.concat(opp_messages).sort! { |a, b| b[:created_at] <=> a[:created_at] }

    elsif params[:type] == "group"

      opponent = Group.find(params[:id])
      @messages = opponent.messages

    end

    @message = Message.new
    @message.user_id = current_user
    render "top/index"
  end

  def create

    message = Message.new(message_params)
    if message.save
      redirect_to root_path
    else
      flash.now[:alert] = "メッセージの送信に失敗しました"
      render "top/index"
    end
  end

  private

  def message_params
    params.require(:message).permit(:text).merge(:user_id)
  end
end
