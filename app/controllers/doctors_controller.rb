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
    doctor.update(
     name: params[:name],
     rating: params[:rating],
     available: params[:available])
    redirect_to "/doctors/#{doctor.id}"
  end

  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy
    redirect_to '/doctors'
  end
end
