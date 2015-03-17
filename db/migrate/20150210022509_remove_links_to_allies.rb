class RemoveLinksToAllies < ActiveRecord::Migration
  def change
    remove_column :allies, :link_id, :integer
  end
end
