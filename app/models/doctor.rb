class Doctor < ApplicationRecord
  belongs_to :clinic

  def self.is_available
    self.where("available = true")
  end
end
