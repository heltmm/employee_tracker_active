class RenamingEmployeeColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column(:employees, :proj_id, :integer)
    add_column(:employees, :project_id, :integer)
    remove_column(:employees, :div_id, :integer)
    add_column(:employees, :division_id, :integer)
  end
end
