Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'chat#index'
  get ':channel/new', to: 'chat#new', as: 'new_message'
  post ':channel', to: 'chat#create', as: 'send_message'
end
