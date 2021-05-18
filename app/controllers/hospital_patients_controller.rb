class HospitalPatientsController < ApplicationController
  def index
    @hospital = Hospital.find(params[:hospital_id])
    if params[:order_alphabetically] == "true"
      @patients = @hospital.patients.order_alphabetically
    else
      @patients = @hospital.patients
    end
  end

  def new
    @hospital = Hospital.find(params[:hospital_id])
  end

  def create
    hospital = Hospital.find(params[:hospital_id])
    patient = hospital.patients.create!(
      name: params[:name],
      age: params[:age],
      visitors: params[:visitors])
    redirect_to "/hospitals/#{hospital.id}/patients"
  end

  def edit
    @hospital = Hospital.find(params[:hospital_id])
    @patient = @hospital.patients.find(params[:id])
  end

  def update
    hospital = Hospital.find(params[:hospital_id])
    patient = hospital.patients.find(params[:id])
    patient.update(
     name: params[:name],
     age: params[:age],
     visitors: params[:visitors])
    redirect_to "/hospitals/#{hospital.id}/patients"
  end
end
