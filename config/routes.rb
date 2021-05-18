Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  get '/hospitals', to: 'hospitals#index'
  get '/hospitals/new', to: 'hospitals#new'
  post '/hospitals', to: 'hospitals#create'

  get '/hospitals/:hospital_id/patients', to: 'hospital_patients#index'
  get '/hospitals/:hospital_id/patients/new', to: 'hospital_patients#new'
  post '/hospitals/:hospital_id/patients', to: 'hospital_patients#create'
  get '/hospitals/:hospital_id/patients/:id/edit', to: 'hospital_patients#edit'
  patch '/hospitals/:hospital_id/patients/:id', to: 'hospital_patients#update'

  delete '/hospitals/:id', to: 'hospitals#destroy'
  get '/hospitals/:id/edit', to: 'hospitals#edit'
  patch '/hospitals/:id', to: 'hospitals#update'
  get '/hospitals/:id', to: 'hospitals#show'

  delete '/patients/:id', to: 'patients#destroy'
  get '/patients', to: 'patients#index'
  get '/patients/:id', to: 'patients#show'
  get '/patients/:id/edit', to: 'patients#edit'
  patch '/patients/:id', to: 'patients#update'


  get '/clinics', to: 'clinics#index'
  get '/clinics/new', to: 'clinics#new'
  delete '/clinics/:id', to: 'clinics#destroy'
  get '/clinics/:id/edit', to: 'clinics#edit'
  patch '/clinics/:id', to: 'clinics#update'
  get '/clinics/:id', to: 'clinics#show'
  post '/clinics', to: 'clinics#create'


  get '/doctors', to: 'doctors#index'
  delete '/doctors/:id', to: 'doctors#destroy'
  get '/doctors/:id', to: 'doctors#show'
  get '/doctors/:id/edit', to: 'doctors#edit'
  patch '/doctors/:id', to: 'doctors#update'

  get '/clinics/:clinic_id/doctors', to: 'clinic_doctors#index'
  get '/clinics/:clinic_id/doctors/new', to: 'clinic_doctors#new'
  post '/clinics/:clinic_id/doctors', to: 'clinic_doctors#create'
  get '/clinics/:clinic_id/doctors/:id/edit', to: 'clinic_doctors#edit'
  patch '/clinics/:clinic_id/doctors/:id', to: 'clinic_doctors#update'
end
