class RemoveRefDateFromContents < ActiveRecord::Migration
  def up
    remove_column :contents, :ref_date
  end

  def down
    add_column :contents, :ref_date, :date
  end
end
