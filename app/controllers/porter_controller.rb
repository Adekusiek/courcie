class PorterController < ApplicationController
  def top
    @search = Demandpost.search(params[:q])

    if user_signed_in?
      @demandposts = current_user.demandposts.includes(:offers, :comments)
    end
  end
end
