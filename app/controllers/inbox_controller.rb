class InboxController < ApplicationController
  before_action :authenticate_user!

  def index
    usercontacts = Usercontact.where(user_id: current_user.id).includes(:messages, :contacted)
    @users = []
    @lastmessages = []
    usercontacts.each do |usercontact|
      @lastmessages << usercontact.messages.order(created_at: :desc).first
      @users << usercontact.contacted
    end
    @array = @users.zip(@lastmessages)
  end

  def show
    # check if the user has the access to this messagebox
    usercontact = Usercontact.find_by(messagebox_id: params[:id], user_id: current_user.id)
    if usercontact.nil?
      redirect_to root_path
    else
      @messages = Message.where(messagebox_id: params[:id]).order(created_at: :desc)
      @user = Usercontact.find_by(messagebox_id: params[:id], user_id: current_user.id).contacted
    end
  end
end
