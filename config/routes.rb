Rails.application.routes.draw do
  get '/sessions/new'
  get '/sessions/create'
  get '/sessions/destroy'
  get '/stocks', to: 'stocks#index'
  get '/stocks/:symbol', to: 'stocks#show', as: :stock
  

  post '/sign_in', to: 'sessions#create'
  delete '/sign_out', to: 'sessions#destroy'
  get '/sign_up', to: 'registrations#new'
  post '/sign_up', to: 'registrations#create'
  
end
