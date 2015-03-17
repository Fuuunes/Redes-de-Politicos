class AddLinksToAllies < ActiveRecord::Migration
  def change
    add_column :allies, :link_id, :integer
  end
end
