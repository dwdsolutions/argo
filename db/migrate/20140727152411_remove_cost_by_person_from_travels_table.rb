class RemoveCostByPersonFromTravelsTable < ActiveRecord::Migration
  def change
    remove_column :travels, :cost_by_person
  end
end
