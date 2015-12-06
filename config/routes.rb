require "sidekiq/web"

Rails.application.routes.draw do
  root "visitors#index"

  post "visitors/contact", to: "visitors#contact"

  mount Sidekiq::Web => "/sidekiq"
end
