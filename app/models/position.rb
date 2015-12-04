class Position < ActiveRecord::Base
  has_many :personils, dependent: :destroy, foreign_key: :jabatan_id
end
