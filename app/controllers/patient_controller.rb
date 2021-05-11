class PatientController < ApplicationController
  def index
    @patients = ['Mike', 'Megan', 'Bob']
  end
end
