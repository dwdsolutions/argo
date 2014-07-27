class ChangeTypeForSponsonContribution < ActiveRecord::Migration
  def change
    change_column :travels, :sponsor_contribution, :text
  end
end
