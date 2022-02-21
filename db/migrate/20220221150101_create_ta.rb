class CreateTa < ActiveRecord::Migration[6.1]
  def change
    create_table :ta do |t|
      t.string :address
      t.string :description
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
