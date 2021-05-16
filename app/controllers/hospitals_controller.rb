class HospitalsController < ApplicationController
  def index
    @hospitals = Hospital.all.order("created_at DESC")
  end

  def show
    @hospital = Hospital.find(params[:id])
  end

  def new
  end

  def create
    hospital = Hospital.create!(
      name: params[:name],
      beds: params[:beds])
    redirect_to "/hospitals"
  end

  def edit
    @hospital = Hospital.find(params[:id])
  end

  def update
  hospital = Hospital.find(params[:id])
   hospital.update(
     name: params[:name],
     beds: params[:beds])
   redirect_to '/hospitals'
  end
end
