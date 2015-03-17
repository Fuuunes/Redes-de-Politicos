class AddZoneToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :zone, :integer
  end
end
