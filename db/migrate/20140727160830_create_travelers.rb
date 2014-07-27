class CreateTravelers < ActiveRecord::Migration
  def change
    create_table :travelers do |t|
      t.string :name
      t.string :position
      t.string :institution
      t.decimal :cost_by_person
      t.references :travel
      t.timestamps
    end
  end
end
