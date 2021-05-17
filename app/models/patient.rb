class Patient < ApplicationRecord
  belongs_to :hospital

  def self.has_visitors
    self.all.where("visitors = true")
  end
end
