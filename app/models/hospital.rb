class Hospital < ApplicationRecord
  has_many :patients

  def self.order_by
    self.all.order("created_at DESC")
  end
end
