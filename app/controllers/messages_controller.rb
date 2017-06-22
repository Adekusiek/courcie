class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  # POST /messages
  # POST /messages.json
  def create
    #initial message hash exist only when comming from offer post. Message from inbox does not contain initial_message
    if(params[:initial_message] == "true")
      # Check if the users had sent message between them
      unless Usercontact.where(user_id: current_user.id, contacted_id: params[:user_to_id]).exists?
        messagebox = Messagebox.create()

        Usercontact.create(user_id: current_user.id, contacted_id: params[:user_to_id], messagebox_id: messagebox.id)
        # This can be written in callback but dont know how to do it...
        Usercontact.create(user_id: params[:user_to_id], contacted_id: current_user.id, messagebox_id: messagebox.id)
      end
    end


    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save

        unless @message.user_to.email.blank?
          MessageNotificationMailer.message_notify(@message).deliver
        end

        if(params[:initial_message]  == true)
          format.html { redirect_to inbox_index_path, notice: 'Message was successfully created.' }
        else
          format.html { redirect_to inbox_index_path }
        end
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      # Get messagebox_id
      usercontact = Usercontact.find_by(user_id: current_user.id, contacted_id: params[:user_to_id])
      params.permit(:content, :user_to_id).merge(user_from_id: current_user.id, messagebox_id: usercontact.messagebox_id)
    end
end
