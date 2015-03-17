class RemoveLinksToCandidates < ActiveRecord::Migration
  def change
    remove_column :candidates, :link_id, :integer
  end
end
