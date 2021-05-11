class DoctorController < ApplicationController
  def index
    @doctors = ['Brian', 'Jamison', 'Ian']
  end
end
