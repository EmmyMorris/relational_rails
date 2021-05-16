class PatientsController < ApplicationController
  def index
    @patients = Patient.all
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
    redirect_to '/patients'
  end
end
