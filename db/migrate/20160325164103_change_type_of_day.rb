class ChangeTypeOfDay < ActiveRecord::Migration
  def change
    change_column :assignations, :day, :datetime
  end
end
