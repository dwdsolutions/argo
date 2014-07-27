class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :travel
      t.string :ip
      t.boolean :vote_down
      t.boolean :vote_up
      t.timestamps
    end
  end
end
