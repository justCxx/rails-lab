class PostmanWorker
  include Sidekiq::Worker

  def perform(h)
    h = JSON.load(h)
    VisitorMailer.contact_email(h["name"], h["email"], "sidekiq: #{h['message']}").deliver
  end
end
