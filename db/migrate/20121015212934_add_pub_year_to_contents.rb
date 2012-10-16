class AddPubYearToContents < ActiveRecord::Migration
  def change
    add_column :contents, :pub_year, :integer
  end
end
