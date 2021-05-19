class Patient < ApplicationRecord
  belongs_to :hospital

  def self.has_visitors
    self.all.where("visitors = true")
  end

  def self.order_alphabetically
    self.all.order(:name)
  end

  def self.filter_by_age(number)
    where('age > ?', number)
  end
end
