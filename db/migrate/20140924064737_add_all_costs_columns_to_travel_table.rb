class AddAllCostsColumnsToTravelTable < ActiveRecord::Migration
  def change
    add_column :travel, :travel_cost, :decimal
    add_column :travel, :viatical_cost, :decimal
    add_column :travel, :lodgement_cost, :decimal
    add_column :travel, :other_cost, :string
  end
end
