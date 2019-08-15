Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  post 'users/postpone/:id', to: 'users#postpone_delete'
  resources :chats
  resources :messages
  mount ActionCable.server => '/chat'
  mount ActionCable.server => '/newuser'
  mount ActionCable.server => '/message'
end
