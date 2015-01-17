class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :url
      t.timestamps
    end
  end
end
