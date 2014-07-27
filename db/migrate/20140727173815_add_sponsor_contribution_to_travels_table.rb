class AddSponsorContributionToTravelsTable < ActiveRecord::Migration
  def change
    add_column :travels, :sponsor_contribution, :string
  end
end
