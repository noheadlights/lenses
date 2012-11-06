class LenseType < ActiveRecord::Base
  attr_accessible :lense_type
  has_many :lenses

end
