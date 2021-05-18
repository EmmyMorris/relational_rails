class Hospital < ApplicationRecord
  has_many :patients, :dependent => :delete_all
end
