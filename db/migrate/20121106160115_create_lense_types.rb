class CreateLenseTypes < ActiveRecord::Migration
  def change
    create_table :lense_types do |t|
      t.string :type

      t.timestamps
    end
  end
end
