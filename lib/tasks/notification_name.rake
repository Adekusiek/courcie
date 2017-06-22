namespace :notification_mail do
  desc "notification mail for matching request"

  task :request_notification => :environment do

    users = User.all.includes(:itineraries)
    users.each do |user|
      if user.request_notification == true
        total_request = 0
        valid_itineraries = []
        latest_requests = []
        request_count = []

        user.itineraries.each do |itinerary|
          if itinerary.departure_date > Date.today
            requests = Demandpost.where(country_from: itinerary.country_from, city_to: itinerary.city_to).order(created_at: :desc)
            latest_requests << requests.first
            valid_itineraries << itinerary

            total_request += requests.count
            request_count << requests.count
          end
        end

        if total_request > 0
          RequestNotificationMailer.request_notify(user, valid_itineraries, request_count, latest_requests).deliver
        end
      end
    end
  end
end
