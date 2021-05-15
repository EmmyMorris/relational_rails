require 'rails_helper'

RSpec.describe Clinic, type: :model do
  describe 'relationships' do
    it {should have_many :doctors}
  end
end
