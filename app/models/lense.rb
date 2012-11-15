class Lense < ActiveRecord::Base
  attr_accessible :brand_id, :lense_type_id, :max_aperture, :max_focal_length, :min_aperture, :min_focal_length, :name, :notes, :lense_type, :brand


  belongs_to :lense_type
  belongs_to :brand

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
    errors.add(:max_aperture, "max_aperture must be equal or larger than min_aperture.") if self.max_aperture && self.min_aperture && self.max_aperture < self.min_aperture
  end

  def max_focal_length_larger_min_focal_length
    errors.add(:max_focal_length, "max_focal_length must be equal or larger than min_focal_length.") if self.max_focal_length && self.min_focal_length && self.max_focal_length < self.min_focal_length
  end


  #def self.search(search_params)
  #  lt = LenseType.find(search_params[:lense_type_selection]).lense_type
  #  at = search_params[:aperture_to].blank? ? 36 : search_params[:aperture_to]
  #  min_fl = search_params[:min_focal_length].blank? ? 0 : search_params[:min_focal_length]
  #  max_fl = search_params[:max_focal_length].blank? ? 2000 : search_params[:max_focal_length]
  #
  #  find(:all, conditions: ['lense_types.lense_type LIKE ? and max_focal_length <= ? and min_focal_length >= ? and min_aperture <= ? ',
  #                          "%#{lt}%",
  #                          "#{max_fl}",
  #                          "#{min_fl}",
  #                          "#{at}"],
  #       :joins => [:lense_type])
  #end


end
