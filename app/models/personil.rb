class Personil < ActiveRecord::Base
  belongs_to :so, foreign_key: :struktur_id
  belongs_to :position, foreign_key: :jabatan_id
  belongs_to :divsubdivision, foreign_key: :bagian_subbagian_id
end
