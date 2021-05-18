class ClinicDoctorsController < ApplicationController
  def index
    @clinic = Clinic.find(params[:clinic_id])
    @doctors = @clinic.doctors
  end

  def new
    @clinic = Clinic.find(params[:clinic_id])
  end

  def create
    clinic = Clinic.find(params[:clinic_id])
    doctor = clinic.doctors.create!(
      name: params[:name],
      rating: params[:rating],
      available: params[:available])
    redirect_to "/clinics/#{clinic.id}/doctors"
  end
end
