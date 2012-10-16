class AddRefYearToContents < ActiveRecord::Migration
  def change
    add_column :contents, :ref_year, :integer
  end
end
