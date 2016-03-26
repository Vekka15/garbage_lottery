class RenameInvited < ActiveRecord::Migration
  def change
    rename_column :users, :invated, :invited
  end
end
