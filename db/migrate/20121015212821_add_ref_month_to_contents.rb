class AddRefMonthToContents < ActiveRecord::Migration
  def change
    add_column :contents, :ref_month, :integer
  end
end
