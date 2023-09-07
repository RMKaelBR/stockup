Rails.application.routes.draw do
  get '/stocks', to: 'stocks#index'
  get '/stocks/:symbol', to: 'stocks#show', as: :stock
  
  get '/sign_up', to: 'registrations#new'
  post '/sign_up', to: 'registrations#create'
  
end

# get '/sign_in', to: 'sessions#new'
# post '/sign_in', to: 'sessions#create', as: 'log_in'
# delete '/logout', to: 'sessions#destroy'
# get '/password', to: 'passwords#edit', as: 'edit_password'
# patch '/password', to: 'passwords#udpate'
# get '/password/reset', to: 'password_resets#new'
# post '/password/reset', to: 'password_resets#create'
# get '/password/reset/edit', to: 'password_resets#edit'
# patch '/password/reset/edit', to: 'password_resets#update'