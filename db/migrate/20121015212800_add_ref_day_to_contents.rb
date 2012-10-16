class AddRefDayToContents < ActiveRecord::Migration
  def change
    add_column :contents, :ref_day, :integer
  end
end
