class CreateDoctor < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.string :name
      t.boolean :available
      t.float :rating

        t.timestamps
    end
  end
end
