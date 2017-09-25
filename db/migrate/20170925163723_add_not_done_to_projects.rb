class AddNotDoneToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column(:projects, :done, :boolean)
  end
end
