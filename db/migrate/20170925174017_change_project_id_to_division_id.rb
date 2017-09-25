class ChangeProjectIdToDivisionId < ActiveRecord::Migration[5.1]
  def change
    remove_column(:projects, :project_id, :integer)
    add_column(:projects, :division_id, :integer)
  end
end
