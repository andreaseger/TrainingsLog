class CreateStrokes < ActiveRecord::Migration
  def self.up
    create_table :strokes do |t|
      t.string :name
    end
  add_index :strokes, :name, :unique => true
  end

  def self.down
    drop_table :strokes
  end
end

