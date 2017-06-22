namespace :notification_mail do
  desc "notification mail for matching request"

  task :notification => :environment do

    users = User.all.includes(:itineraries)
    users.each do |user|
      total_request = 0
      valid_itineraries = []
      requests = []

      user.itineraries.each do |itinerary|
        if itinerary.departure_date > Date.today
          requestNb = Demandpost.where(country_from: itinerary.country_from, city_to: itinerary.city_to).count
          valid_itineraries << itinerary
          total_request += requestNb
          requests << requestNb
        end
      end

      if total_request > 0
        NotificationMailer.notify(user, valid_itineraries, requests).deliver
      end
    end


  end
end
