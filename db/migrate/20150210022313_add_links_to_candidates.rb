class AddLinksToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :link_id, :integer
  end
end
