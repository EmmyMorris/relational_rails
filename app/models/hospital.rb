class Hospital < ApplicationRecord
  has_many :patients

  def self.order_by_created_at
    self.all.order(created_at: :desc)
  end
end
