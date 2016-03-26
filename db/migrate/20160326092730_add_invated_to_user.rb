class AddInvatedToUser < ActiveRecord::Migration
  def change
    add_column :users, :invated, :boolean
  end
end
