class RenameColumnTypeToLenseType < ActiveRecord::Migration
  def up
    rename_column :lense_types, :type, :lense_type
  end

  def down
    rename_column :lense_types, :lense_type, :type
  end
end
