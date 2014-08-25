class AddActiveFieldToTravels < ActiveRecord::Migration
  def change
    add_column :travels, :active, :boolean, default: true
  end
end
