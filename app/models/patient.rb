class Patient < ApplicationRecord
  belongs_to :hospital

  def self.visitors
    self.all.where("visitors = true")
  end
end
