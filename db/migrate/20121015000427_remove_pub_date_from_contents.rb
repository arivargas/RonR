class RemovePubDateFromContents < ActiveRecord::Migration
  def up
    remove_column :contents, :pub_date
  end

  def down
    add_column :contents, :pub_date, :date
  end
end
