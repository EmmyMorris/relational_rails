class Doctor < ApplicationRecord
  belongs_to :clinic

  def self.is_available
    self.where("available = true")
  end

  def self.order_alphabetically
    self.all.order(:name)
  end

  def self.sort_by_rating(number)
    if number
      self.where(:rating > number)
    else
      self.all
    end
  end
end
