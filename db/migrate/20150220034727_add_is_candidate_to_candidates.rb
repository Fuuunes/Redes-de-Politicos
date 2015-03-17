class AddIsCandidateToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :is_candidate, :integer
  end
end
