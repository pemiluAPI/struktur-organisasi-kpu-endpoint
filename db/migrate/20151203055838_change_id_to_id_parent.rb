class ChangeIdToIdParent < ActiveRecord::Migration
  def change
    rename_column :personils, :so_id, :struktur_id
    rename_column :personils, :position_id, :jabatan_id
    rename_column :personils, :divsubdivision_id, :bagian_subbagian_id
    rename_column :divsubdivisions, :division_id, :bagian_id
    rename_column :divsubdivisions, :subdivision_id, :subbagian_id
  end
end
