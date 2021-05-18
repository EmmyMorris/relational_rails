class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.order_by_created_at
    all.order(created_at: :desc)
  end
end
