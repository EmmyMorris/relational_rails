class AddClinicToDoctors < ActiveRecord::Migration[5.2]
  def change
    add_reference :doctors, :clinic, foreign_key: true
  end
end
