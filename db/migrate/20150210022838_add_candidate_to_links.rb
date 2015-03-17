class AddCandidateToLinks < ActiveRecord::Migration
  def change
    add_column :links, :candidate_id, :integer
  end
end
