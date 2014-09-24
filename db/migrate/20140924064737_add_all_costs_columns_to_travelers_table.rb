class AddAllCostsColumnsToTravelerTable < ActiveRecord::Migration
  def change
    add_column :travelers, :travel_cost, :decimal
    add_column :travelers, :viatical_cost, :decimal
    add_column :travelers, :lodgement_cost, :decimal
    add_column :travelers, :other_cost, :string
  end
end
