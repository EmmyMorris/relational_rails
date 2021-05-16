Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  get '/hospitals', to: 'hospitals#index'
  get '/hospitals/new', to: 'hospitals#new'
  post '/hospitals', to: 'hospitals#create'
  get '/hospitals/:id', to: 'hospitals#show'
  get '/hospitals/:hospital_id/patients', to: 'hospital_patients#index'


  get '/patients', to: 'patients#index'
  get '/patients/:id', to: 'patients#show'

  get '/clinics', to: 'clinics#index'
  get '/clinics/:id', to: 'clinics#show'
  get '/doctors', to: 'doctors#index'
  get '/doctors/:id', to: 'doctors#show'

  get '/clinics/:clinic_id/doctors', to: 'clinic_doctors#index'
end
