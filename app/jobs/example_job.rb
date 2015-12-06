class ExampleJob < ApplicationJob
  queue_as :default

  def perform(h)
    h = JSON.load(h)
    VisitorMailer.contact_email(h["name"], h["email"], "active-job: #{h['message']}").deliver
  end
end
