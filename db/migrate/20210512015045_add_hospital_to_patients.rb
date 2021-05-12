class AddHospitalToPatients < ActiveRecord::Migration[5.2]
  def change
    add_reference :patients, :hospital, foreign_key: true
  end
end
