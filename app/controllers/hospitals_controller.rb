class HospitalsController < ApplicationController
  def index
    @hospitals = Hospital.all.order("created_at DESC")
  end

  def show
    @hospital = Hospital.find(params[:id])
  end
end
