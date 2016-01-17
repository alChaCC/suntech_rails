Rails.application.routes.draw do
  mount SuntechRails::Engine => "/suntech_rails"
  resources :buysafes, only: :show
end
