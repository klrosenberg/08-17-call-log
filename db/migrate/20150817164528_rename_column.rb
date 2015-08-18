class RenameColumn < ActiveRecord::Migration
  def change
    change_column :people, :number, :string
  end
end
