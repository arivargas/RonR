class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :author
      t.date :pub_date
      t.date :ref_date
      t.string :title1
      t.string :title2
      t.string :website
      t.string :volume
      t.string :edition
      t.string :pub_place
      t.string :pub_house
      t.string :journal_num
      t.string :pages
      t.references :User

      t.timestamps
    end
    add_index :contents, :User_id
  end
end
