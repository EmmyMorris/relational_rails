class CreatePatient < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.integer :hospital_id
      t.string :name
      t.datetime :created_at
      t.datetime :updated_at
      t.boolean :visitors
      t.integer :age
    end
  end
end
