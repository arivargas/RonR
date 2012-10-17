class RemoveUserIdFromContents < ActiveRecord::Migration
  def up
    remove_column :contents, :User_id
  end

  def down
    add_column :contents, :User_id, :integer
  end
end
