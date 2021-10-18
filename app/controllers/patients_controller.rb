class PatientsController < ApplicationController
  def index
    @patients = Patient.has_visitors
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    patient = Patient.find(params[:id])
    patient.update(patient_params)
    redirect_to "/patients/#{patient.id}"
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy
    redirect_to "/patients"
  end

  private

  def patient_params
    params.permit(:name, :visitors, :age)
  end
end
