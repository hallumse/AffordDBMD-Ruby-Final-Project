class UserJob < ApplicationJob
  queue_as :default

  def perform(*guests)
    # Do something later
    if user_clicks_on_button
    else

  end
end
