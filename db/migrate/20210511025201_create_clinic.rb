class CreateClinic < ActiveRecord::Migration[5.2]
  def change
    create_table :clinics do |t|
      t.string :name
      t.datetime :created_at
      t.datetime :updated_at
      t.boolean :open_close
      t.integer :computers
    end
  end
end
