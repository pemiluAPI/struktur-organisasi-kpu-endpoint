class CreateDivsubdivisions < ActiveRecord::Migration
  def change
    create_table :divsubdivisions do |t|
      t.references :division
      t.references :subdivision

      t.timestamps
    end
    add_index :divsubdivisions, :division_id
    add_index :divsubdivisions, :subdivision_id
  end
end
