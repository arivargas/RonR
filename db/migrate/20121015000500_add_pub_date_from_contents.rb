class AddPubDateFromContents < ActiveRecord::Migration
  def change
    add_column :contents, :pub_date, :string
  end
end
