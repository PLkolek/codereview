class CreateTextFiles < ActiveRecord::Migration
  def change
    create_table :text_files do |t|
      t.string :name
      t.references :review, index: true

      t.timestamps
    end
  end
end
