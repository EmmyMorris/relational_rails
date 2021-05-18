class ClinicsController < ApplicationController
  def index
    @clinics = Clinic.order_by_created_at
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

  def edit
    @clinic = Clinic.find(params[:id])
  end

  def update
    clinic = Clinic.find(params[:id])
    clinic.update(
     name: params[:name],
     computers: params[:computers],
     open: params[:open])
    redirect_to "/clinics/#{clinic.id}"
  end

  def destroy
    @clinic = Clinic.find(params[:id])
    @clinic.destroy
    redirect_to "/clinics"
  end
end
