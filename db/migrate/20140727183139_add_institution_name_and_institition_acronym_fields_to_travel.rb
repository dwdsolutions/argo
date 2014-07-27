class AddInstitutionNameAndInstititionAcronymFieldsToTravel < ActiveRecord::Migration
  def change
    add_column :travels, :institution_name, :string
    add_column :travels, :institution_response, :string
  end
end
