class AddSponsorContributionToTravelsTable < ActiveRecord::Migration
  def change
    add_column :travel, :sponsor_contribution, :string
  end
end
