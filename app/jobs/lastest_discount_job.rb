class LastestDiscountJob < ApplicationJob
  queue_as :default

  def perform(text)
    # Do something later
    TextNotifier.new(text).notify
  end
end
