class AddRefTypeFromContents < ActiveRecord::Migration
  def change
    add_column :contents, :ref_type, :integer
  end
end
