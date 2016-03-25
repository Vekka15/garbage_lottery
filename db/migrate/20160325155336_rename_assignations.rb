class RenameAssignations < ActiveRecord::Migration
  def change
    rename_table :assigantions, :assignations
  end
end
