class HospitalController < ApplicationController
  def index
    @hospitals = Hospital.all
  end
end
