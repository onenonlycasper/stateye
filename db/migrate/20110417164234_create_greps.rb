class CreateGreps < ActiveRecord::Migration
  def self.up
    create_table :greps do |t|
      t.string :name
      t.string :search

      t.timestamps
    end
  end

  def self.down
    drop_table :greps
  end
end
