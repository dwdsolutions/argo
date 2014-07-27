class AddCountryCityAndAirportCodeFieldsToTravelsTable < ActiveRecord::Migration
  def change
    add_column :travels, :country, :string
    add_column :travels, :city, :string
    add_column :travels, :airport_code, :string
    add_index :travels, :country
  end
end
