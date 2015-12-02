class CreateCommisionerStructures < ActiveRecord::Migration
  def change
    create_table :commisioner_structures do |t|
      t.references  :commisioner_structure_list
      t.string  :position
      t.string  :name
      t.string  :parent_id
      t.timestamps
    end
    add_index :commisioner_structures, :commisioner_structure_list_id
  end
end
