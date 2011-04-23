class CreateRaws < ActiveRecord::Migration
  def self.up
    create_table :raws do |t|
      t.integer :grep_id
      t.date :date
      t.integer :value

      t.timestamps
    end
  end

  def self.down
    drop_table :raws
  end
end
