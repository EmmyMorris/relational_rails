class CreatePatient < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :name
      t.boolean :visitors
      t.integer :age

      t.timestamps
    end
  end
end
