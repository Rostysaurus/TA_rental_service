class AddNameToTeachers < ActiveRecord::Migration[6.1]
  def change
    add_column :teachers, :name, :string
  end
end
