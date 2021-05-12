class CreateClinic < ActiveRecord::Migration[5.2]
  def change
    create_table :clinics do |t|
      t.string :name
      t.boolean :open
      t.integer :computers

      t.timestamps
    end
  end
end
