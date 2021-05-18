class Clinic < ApplicationRecord
  has_many :doctors

  def self.order_by_created_at
    self.all.order(created_at: :desc)
  end
end
