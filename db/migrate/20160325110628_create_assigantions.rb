class CreateAssigantions < ActiveRecord::Migration
  def change
    create_table :assigantions do |t|
      t.date :day
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
