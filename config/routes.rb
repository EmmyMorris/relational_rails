Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  get '/hospital', to: 'hospital#index'
  get '/patient', to: 'patient#index'
  get '/clinic', to: 'clinic#index'
  get '/doctor', to: 'doctor#index'
end
