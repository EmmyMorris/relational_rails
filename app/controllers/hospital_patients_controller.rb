class HospitalPatientsController < ApplicationController
  def index
    hospital = Hospital.find(params[:hospital_id])
    @patients = hospital.patients
  end
end
