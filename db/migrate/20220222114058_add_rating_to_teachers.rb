class AddRatingToTeachers < ActiveRecord::Migration[6.1]
  def change
    add_column :teachers, :rating, :integer
  end
end
