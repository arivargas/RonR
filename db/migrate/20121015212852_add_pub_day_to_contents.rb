class AddPubDayToContents < ActiveRecord::Migration
  def change
    add_column :contents, :pub_day, :integer
  end
end
