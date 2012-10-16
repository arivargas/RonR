class AddFindDateFromContents < ActiveRecord::Migration
  def change
    add_column :contents, :find_date, :date
  end
end
