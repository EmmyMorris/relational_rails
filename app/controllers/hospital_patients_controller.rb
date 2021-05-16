class HospitalPatientsController < ApplicationController
  def index
    @hospital = Hospital.find(params[:hospital_id])
    @patients = @hospital.patients
  end

  def new
    @hospital = Hospital.find(params[:hospital_id])
  end

  def create
    hospital = Hospital.find(params[:hospital_id])
    patient = hospital.patients.create!(
      name: params[:name],
      age: params[:age])
    redirect_to "/hospitals/#{hospital.id}/patients"
  end
end
