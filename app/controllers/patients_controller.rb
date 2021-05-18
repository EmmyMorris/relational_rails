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
    patient.update(
     name: params[:name],
     age: params[:age],
     visitors: params[:visitors])
    redirect_to "/patients/#{patient.id}"
  end
end
