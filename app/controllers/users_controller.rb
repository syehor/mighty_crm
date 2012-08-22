class UsersController < ApplicationController

  def user_autocomplete
    users = User.where "name like ?", "%#{params[:term]}%"
    users_json = []
    users.each do |user|
      users_json << {label: user.name, id: user.id}
    end
    render json: users_json.to_json
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        format.html { redirect_to new_user_event_path(@user), notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

end
