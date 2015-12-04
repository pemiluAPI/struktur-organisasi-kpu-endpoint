class So < ActiveRecord::Base # So => Struktur Organisasi
  has_many :personils, dependent: :destroy, foreign_key: :struktur_id
end
