class CreateRevisions < ActiveRecord::Migration
  def change
    create_table :revisions do |t|
      t.integer :number
      t.references :review, index: true

      t.timestamps
    end
  end
end
