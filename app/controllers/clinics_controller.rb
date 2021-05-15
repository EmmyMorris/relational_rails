class ClinicsController < ApplicationController
  def index
    @clinics = Clinic.all.order("created_at DESC")
  end

  def show
    @clinic = Clinic.find(params[:id])
  end
end
