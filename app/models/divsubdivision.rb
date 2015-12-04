class Divsubdivision < ActiveRecord::Base
  has_many :personils, dependent: :destroy, foreign_key: :bagian_subbagian_id
  belongs_to :division, foreign_key: :bagian_id
  belongs_to :subdivision, foreign_key: :subbagian_id
end
