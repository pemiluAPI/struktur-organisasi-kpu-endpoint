class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :nama_jabatan

      t.timestamps
    end
  end
end
