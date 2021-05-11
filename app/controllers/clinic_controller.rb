class ClinicController < ApplicationController
  def index
    @clinics = ['First Priority', 'Medical Plus', 'Healing Helpers']
  end
end
