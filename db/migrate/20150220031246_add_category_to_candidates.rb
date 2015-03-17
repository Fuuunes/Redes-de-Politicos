class AddCategoryToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :category, :integer
  end
end
