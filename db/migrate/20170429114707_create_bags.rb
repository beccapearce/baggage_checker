class CreateBags < ActiveRecord::Migration[5.0]
  def change
    create_table :bags do |t|
      t.string :name
      t.integer :number
      t.text :description
      t.boolean :lost
      t.integer :journey_status
      t.integer :location

      t.timestamps
    end
  end
end
