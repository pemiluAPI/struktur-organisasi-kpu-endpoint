class CreateCommisionerStructureLists < ActiveRecord::Migration
  def change
    create_table :commisioner_structure_lists do |t|
      t.string :name
      t.string :period_start
      t.string :period_finish
      t.timestamps
    end
  end
end
