class AddPubMonthToContents < ActiveRecord::Migration
  def change
    add_column :contents, :pub_month, :integer
  end
end
