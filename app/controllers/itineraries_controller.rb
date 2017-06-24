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

  # DELETE /itineraries/1
  # DELETE /itineraries/1.json
  def destroy
    # why i have to queue two times itinerary? for set_itinerary_delete and here as well?
    @itinerary = Itinerary.find(params[:id])

    if @itinerary.user_id == current_user.id
      @itinerary.destroy
      respond_to do |format|
        format.html { redirect_to edit_user_url(current_user), notice: 'Itinerary was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to root_path
    end
  end


private

# Never trust parameters from the scary internet, only allow the white list through.
  def itinerary_params
    params.require(:itinerary).permit(:city_to, :country_from, :departure_date).merge(user_id: current_user.id)
  end

end
