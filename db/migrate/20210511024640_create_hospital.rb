class CreateHospital < ActiveRecord::Migration[5.2]
  def change
    create_table :hospitals do |t|
      t.string :name
      t.datetime :created_at
      t.datetime :updated_at
      t.boolean :max_capacity
      t.integer :beds
    end
  end
end
