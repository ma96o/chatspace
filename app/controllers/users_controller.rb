class UsersController < ApplicationController
  def index
    name = params[:keyword]
    @users = User.where('name LIKE ? and not id = ?', name, current_user.id)
    render json: @users
  end
end
