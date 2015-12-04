class Subdivision < ActiveRecord::Base
  has_many :divsubdivisions
  has_many :divisions, through: :divsubdivisions
end
