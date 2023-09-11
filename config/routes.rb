Rails.application.routes.draw do
  get '/stocks', to: 'stocks#index'
  get '/stocks/:symbol', to: 'stocks#show', as: :stock
  

  post '/sign_in', to: 'sessions#create'
  delete '/sign_out', to: 'sessions#destroy'
  post '/sign_up', to: 'registrations#create'
  
end
