class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.is_available
  end

  def show
    @doctor = Doctor.find(params[:id])
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    doctor = Doctor.find(params[:id])
    doctor.update(doctor_params)
    redirect_to "/doctors/#{doctor.id}"
  end

  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy
    redirect_to '/doctors'
  end

  private

  def doctor_params
    params.permit(:name, :available, :rating)
  end
end
