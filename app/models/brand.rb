class Brand < ActiveRecord::Base
  attr_accessible :name
  has_many :lenses

  def find_or_create_by_code!(name)
    b = Brand.find_by_lense_type(name)
    unless b
      b=Brand.new
      b.name=name
      b.save
    end
    b
  end

end
