class CreateSos < ActiveRecord::Migration
  def change
    create_table :sos do |t|
      t.string :nama_so

      t.timestamps
    end
  end
end
