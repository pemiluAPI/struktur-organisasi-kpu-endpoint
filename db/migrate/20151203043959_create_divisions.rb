class CreateDivisions < ActiveRecord::Migration
  def change
    create_table :divisions do |t|
      t.string :nama_bagian

      t.timestamps
    end
  end
end
