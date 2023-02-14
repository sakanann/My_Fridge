Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :food_stocks
  root 'food_stocks#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # if Rails.env.development?
  #   mount LetterOpenerWeb::Engine, at: "/letter_opener"
  # end
  }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'

    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    #ゲストログイン用のパスを追加
  end
end
