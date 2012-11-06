class Lense < ActiveRecord::Base
  attr_accessible :brand_id, :lense_type_id, :max_aperture, :max_focal_length, :min_aperture, :min_focal_length, :name, :notes


  has_one :lense_type
  has_one :brand

  validate :max_aperture_larger_min_aperture
  validate :max_focal_length_larger_min_focal_length

  validates :name, presence: true, uniqueness: true
  validates :brand, presence: true
  validates :lense_type, presence: true
  validates :min_aperture, presence: true, numericality: {greater_than: 0}
  validates :max_aperture, presence: true, numericality: {greater_than: 0}
  validates :max_focal_length, presence: true, numericality: {greater_than: 0}
  validates :min_focal_length, presence: true, numericality: {greater_than: 0}

  def max_aperture_larger_min_aperture
    errors.add(:max_aperture, "max_aperture must be larger than min_aperture.") if self.max_aperture && self.min_aperture && self.max_aperture < self.min_aperture
  end
  def max_focal_length_larger_min_focal_length
    errors.add(:max_focal_length, "max_aperture must be larger than min_aperture.") if self.max_focal_length && self.min_focal_length && self.max_focal_length < self.min_focal_length
  end



  def self.search(search)
    if search
      find(:all, :conditions => ['lens_types.type LIKE ?', "%#{search}%"], :joins => [:lens_type])
    else
      find(:all)
    end
  end


end
