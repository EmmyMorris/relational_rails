class ClinicDoctorsController < ApplicationController
  def index
    clinic = Clinic.find(params[:clinic_id])
    @doctors = clinic.doctors
  end
end
