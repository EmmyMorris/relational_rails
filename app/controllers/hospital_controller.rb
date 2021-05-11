class HospitalController < ApplicationController
  def index
    @hospitals = ['St. Lukes', 'Sky Ridge', 'Denver Health']
  end
end
