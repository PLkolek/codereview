class AddReviewToComment < ActiveRecord::Migration
  def change
    add_reference :comments, :review
  end
end
