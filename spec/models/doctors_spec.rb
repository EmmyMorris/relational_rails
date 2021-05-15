require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe 'relationships' do
    it {should belong_to :clinic}
  end
end
