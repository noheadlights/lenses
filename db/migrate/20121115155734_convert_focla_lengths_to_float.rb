class ConvertFoclaLengthsToFloat < ActiveRecord::Migration
  def self.up
    change_table :lenses do |t|
      t.change :max_focal_length, :float
      t.change :min_focal_length, :float
    end
  end

  def self.down
    change_table :lenses do |t|
      t.change :max_focal_length, :integer
      t.change :min_focal_length, :integer
    end
  end
end
