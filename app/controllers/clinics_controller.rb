class ClinicsController < ApplicationController
  def index
    @clinics = Clinic.all.order("created_at DESC")
  end

  def show
    @clinic = Clinic.find(params[:id])
  end

  def new
  end

  def create
    clinic = Clinic.create!(
      name: params[:name],
      computers: params[:computers],
      open: params[:open])
    redirect_to "/clinics"
  end
end
