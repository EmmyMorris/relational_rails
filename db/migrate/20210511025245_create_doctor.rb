class CreateDoctor < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.integer :clinic_id
      t.string :name
      t.datetime :created_at
      t.datetime :updated_at
      t.boolean :available
      t.float :rating
    end
  end
end
