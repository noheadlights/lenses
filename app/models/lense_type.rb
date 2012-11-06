class LenseType < ActiveRecord::Base
  attr_accessible :type
  has_many :lenses

end
