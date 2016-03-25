class AddEmailToAssigantion < ActiveRecord::Migration
  def change
    add_column :assignations, :user_mail, :string
  end
end
