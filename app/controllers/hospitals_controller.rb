class HospitalsController < ApplicationController
  def index
    @hospitals = Hospital.all
  end

  def show
    # binding.pry
    @hospital = Hospital.find(params[:id])
  end
end
