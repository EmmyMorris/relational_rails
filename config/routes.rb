Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get '/', to: 'welcome#index'
  get '/hospitals', to: 'hospitals#index'
  get '/hospitals/:id', to: 'hospitals#show'
  get '/patients', to: 'patients#index'

  get '/clinics', to: 'clinics#index'
  get '/doctors', to: 'doctors#index'
end
