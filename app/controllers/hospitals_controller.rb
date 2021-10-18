class HospitalsController < ApplicationController
  def index
    @hospitals = Hospital.order_by_created_at
  end

  def show
    @hospital = Hospital.find(params[:id])
  end

  def new
  end

  def create
    hospital = Hospital.create!(hospital_params)
    redirect_to "/hospitals"
  end

  def edit
    @hospital = Hospital.find(params[:id])
  end

  def update
    hospital = Hospital.find(params[:id])
    hospital.update(hospital_params)
    redirect_to "/hospitals/#{hospital.id}"
  end

  def destroy
    @hospital = Hospital.find(params[:id])
    @hospital.destroy
    redirect_to "/hospitals"
  end

  private
  
  def hospital_params
    params.permit(:name, :max_capacity, :beds)
  end
end
