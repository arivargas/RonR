class RemoveFindDatFromContents < ActiveRecord::Migration
  def up
    remove_column :contents, :find_date
  end

  def down
    add_column :contents, :find_date, :string
  end
end
