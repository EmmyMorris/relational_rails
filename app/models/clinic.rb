class Clinic < ApplicationRecord
  has_many :doctors, :dependent => :delete_all
end
