class CreateLenses < ActiveRecord::Migration
  def change
    create_table :lenses do |t|
      t.integer :brand_id
      t.float :max_aperture
      t.float :min_aperture
      t.integer :max_focal_length
      t.integer :min_focal_length
      t.string :name
      t.string :notes
      t.string :lense_type_id

      t.timestamps
    end
  end
end
