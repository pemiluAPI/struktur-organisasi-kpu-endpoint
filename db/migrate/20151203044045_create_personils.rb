class CreatePersonils < ActiveRecord::Migration
  def change
    create_table :personils do |t|
      t.references :so
      t.references :position
      t.string :nama
      t.string :golongan
      t.string :no_induk
      t.references :divsubdivision

      t.timestamps
    end
    add_index :personils, :so_id
    add_index :personils, :position_id
    add_index :personils, :divsubdivision_id
  end
end
