class TopController < ApplicationController

  def index
    if user_signed_in?
      @demandposts = Demandpost.last(5)
    end
  end

end
