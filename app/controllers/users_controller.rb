class UsersController < ApplicationController
  def index
    users = User.where "name like ?", "%#{params[:term]}%"
    render json: users.map(&:name)
  end
end
