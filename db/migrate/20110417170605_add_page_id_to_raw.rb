class AddPageIdToRaw < ActiveRecord::Migration
  def self.up
    add_column :raws, :page_id, :integer
  end

  def self.down
    remove_column :raws, :page_id
  end
end
