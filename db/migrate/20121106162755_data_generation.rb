class DataGeneration < ActiveRecord::Migration
  def up
    %w("Telezoom" "Wideangle" "Ultrawide" "Normal" 'Wide- to Telezoom').each do |l|
      lense_type = LenseType.new()
      lense_type.type=l
      lense_type.save
    end
    brand=Brand.new
    brand.name = "Canon"
    brand.save

  end

  def down
    LenseType.delete_all
    Brand.delete_all
  end
end
