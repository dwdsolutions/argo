class ChangeNameToInstitutionResponseToInstitutionAcronym < ActiveRecord::Migration
  def change
    rename_column :travels, :institution_response, :institution_acronym
  end
end
