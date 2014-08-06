class CreateInstitutions < ActiveRecord::Migration
  def change
    create_table :institutions do |t|
      t.string :name
      t.integer :institution_type_id
      t.string :acronym
      t.boolean :accepts_online_information_requests
      t.boolean :at_complaints
      t.boolean :at_information_requests
      t.string :facebook_url
      t.integer :information_request_correlative
      t.integer :information_standard_category_id
      t.boolean :ranked
      t.string :twitter_url
      t.string :website_url
      t.timestamps
    end
  end
end
