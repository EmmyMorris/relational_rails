class CreateHospital < ActiveRecord::Migration[5.2]
  def change
    create_table :hospitals do |t|
      t.string :name
      t.boolean :max_capacity
      t.integer :beds

      t.timestamps
    end
  end
end
