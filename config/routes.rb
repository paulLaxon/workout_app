# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'dashboard#index'

  resources :users do
    resources :exercises
  end
end
