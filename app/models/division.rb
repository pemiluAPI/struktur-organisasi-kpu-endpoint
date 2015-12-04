class Division < ActiveRecord::Base
  has_many :divsubdivisions
  has_many :subdivisions, through: :divsubdivisions
end
