class AddRefDateToContents < ActiveRecord::Migration
  def change
    add_column :contents, :ref_date, :string
  end
end
