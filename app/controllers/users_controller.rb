class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :confirm_user, only: [:edit, :update]

  def show

  end

  def edit
    @itinerary = Itinerary.new
    registered_itineraries = Itinerary.where(user_id: params[:id])
    # there should be a better way to express this...
    @my_itineraries = []
    registered_itineraries.each do |itinerary|
      @my_itineraries << itinerary if itinerary.departure_date > Date.today
    end
  end

  def update
    current_user.update(update_params)
    redirect_to edit_user_path(current_user)
  end

  private
  def update_params
    params.require(:user).permit(:name, :home_town, :avatar, :message_notification, :request_notification)
  end

  def confirm_user
    redirect_to root_path unless current_user == User.find(params[:id])
  end
end
