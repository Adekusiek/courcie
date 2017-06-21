class ItinerariesController < ApplicationController
  before_action :authenticate_user!


  def create

    @itinerary = Itinerary.new(itinerary_params)

    respond_to do |format|
      if @itinerary.save
        format.html { redirect_to edit_user_path(current_user), notice: 'Demandpost was successfully created.' }
        format.json { redirect_to edit_user_path(current_user) }
      else
        format.html { redirect_to edit_user_path(current_user) }
        format.json { redirect_to edit_user_path(current_user) }
      end
    end

  end

private
# Never trust parameters from the scary internet, only allow the white list through.
  def itinerary_params
    params.require(:itinerary).permit(:city_to, :country_from, :departure_date).merge(user_id: current_user.id)
  end

end
