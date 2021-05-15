require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'relationships' do
    it {should have_many :patients}
  end
end
