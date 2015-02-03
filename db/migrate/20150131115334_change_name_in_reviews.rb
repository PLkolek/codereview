class ChangeNameInReviews < ActiveRecord::Migration
  def change
    change_column :reviews, :name, :string, null:false
  end
end
