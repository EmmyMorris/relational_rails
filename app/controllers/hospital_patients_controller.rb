class HospitalPatientsController < ApplicationController
  def index
    @hospital = Hospital.find(params[:hospital_id])
    @patients = @hospital.patients
    if params[:order_alphabetically]
      @patients = @hospital.patients.order_alphabetically
    end
    if params[:filter_by_age]
      @patients = @hospital.patients.filter_by_age(params[:filter_by_age])
    end
  end

  def new
    @hospital = Hospital.find(params[:hospital_id])
  end

  def create
    hospital = Hospital.find(params[:hospital_id])
    patient = hospital.patients.create!(hospital_patient_params)
    redirect_to "/hospitals/#{hospital.id}/patients"
  end

  def edit
    @hospital = Hospital.find(params[:hospital_id])
    @patient = @hospital.patients.find(params[:id])
  end

  def update
    hospital = Hospital.find(params[:hospital_id])
    patient = hospital.patients.find(params[:id])
    patient.update(hospital_patient_params)
    redirect_to "/hospitals/#{hospital.id}/patients"
  end

  def destroy
    @hospital = Hospital.find(params[:hospital_id])
    @patient = Patient.find(params[:id])
    @patient.destroy
    redirect_to "/hospitals/#{@hospital.id}/patients"
  end

  private

  def hospital_patient_params
    params.permit(:name, :visitors, :age, :hospital_id)
  end
end
