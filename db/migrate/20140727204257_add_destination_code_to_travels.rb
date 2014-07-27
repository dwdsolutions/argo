class AddDestinationCodeToTravels < ActiveRecord::Migration
  def change
	add_column :travels, :destination_code, :string
  end
end
