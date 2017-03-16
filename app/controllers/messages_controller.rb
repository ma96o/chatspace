class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    if message.save
      redirect_to root_path
    else
      flash.now[:alert] = "メッセージの送信に失敗しました"
      render "top#index"
    end
  end

  private

  def message_params
    params.require(:message).permit(:text, :user_id)
  end
end
