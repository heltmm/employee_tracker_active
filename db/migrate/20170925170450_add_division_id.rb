class AddDivisionId < ActiveRecord::Migration[5.1]
  def change
    add_column(:projects, :project_id, :integer)
  end
end
