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
    hospital = Hospital.create!(
      name: params[:name],
      beds: params[:beds],
      max_capacity: params[:max_capacity])
    redirect_to "/hospitals"
  end

  def edit
    @hospital = Hospital.find(params[:id])
  end

  def update
    hospital = Hospital.find(params[:id])
    hospital.update(
     name: params[:name],
     beds: params[:beds],
     max_capacity: params[:max_capacity])
    redirect_to "/hospitals/#{hospital.id}"
  end

  def destroy
    @hospital = Hospital.find(params[:id])
    @hospital.destroy
    redirect_to "/hospitals"
  end
end
