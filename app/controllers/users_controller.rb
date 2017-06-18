class UsersController < ApplicationController
  before_action :authenticate_user!

  def show

  end

  def edit
  end

  def update
    current_user.update(update_params)
    redirect_to edit_user_path(current_user)
  end

  private
  def update_params
    params.require(:user).permit(:name, :home_town, :avatar)
  end
end
