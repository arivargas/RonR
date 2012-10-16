class AddFindDateToContents < ActiveRecord::Migration
  def change
    add_column :contents, :find_date, :string
  end
end
