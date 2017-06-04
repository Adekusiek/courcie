class MessageboxesController < ApplicationController
  before_action :set_messagebox, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # POST /messageboxes
  # POST /messageboxes.json
  def create
    @messagebox = Messagebox.new(messagebox_params)

    respond_to do |format|
      if @messagebox.save
        format.html { redirect_to @messagebox, notice: 'Messagebox was successfully created.' }
        format.json { render :show, status: :created, location: @messagebox }
      else
        format.html { render :new }
        format.json { render json: @messagebox.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /messageboxes/1
  # DELETE /messageboxes/1.json
  def destroy
    @messagebox.destroy
    respond_to do |format|
      format.html { redirect_to messageboxes_url, notice: 'Messagebox was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_messagebox
      @messagebox = Messagebox.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def messagebox_params
      params.require(:messagebox).permit(:message_id)
    end
end
