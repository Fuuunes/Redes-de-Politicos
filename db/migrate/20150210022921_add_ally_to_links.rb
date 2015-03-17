class AddAllyToLinks < ActiveRecord::Migration
  def change
    add_column :links, :ally_id, :integer
  end
end
