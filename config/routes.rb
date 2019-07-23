# frozen_string_literal: true

Rails.application.routes.draw do
  resources :applications, param: :token do
    resources :chats, param: :number do
      resources :messages, param: :number do
        collection do
          get :search
        end
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
