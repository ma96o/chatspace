Rails.application.routes.draw do
  root 'groups#new'
  devise_for :users
  resources :groups, except: %i(index delete show) do
    resources :messages, only: %i(index create)
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
