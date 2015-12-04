class CreateSubdivisions < ActiveRecord::Migration
  def change
    create_table :subdivisions do |t|
      t.string :nama_subbagian

      t.timestamps
    end
  end
end
