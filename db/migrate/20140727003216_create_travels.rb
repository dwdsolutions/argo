class CreateTravels < ActiveRecord::Migration
  def change
    create_table :travels do |t|
      t.string :name
      t.string :destination
      t.integer :passengers_number
      t.string :description
      t.decimal :cost_by_person, :precision => 10, :scale => 2
      t.decimal :total_cost, :precision => 10, :scale => 2
      t.datetime :start_date
      t.datetime :end_date
      t.timestamps
    end
  end
end
