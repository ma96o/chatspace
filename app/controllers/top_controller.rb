class TopController < ApplicationController
  def index
    @message = Message.new
    @message.user_id = current_user.id
  end
end
