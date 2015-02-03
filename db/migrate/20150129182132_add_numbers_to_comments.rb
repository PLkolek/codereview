class AddNumbersToComments < ActiveRecord::Migration
  def change
    add_column :comments, :old_no, :integer
    add_column :comments, :new_no, :integer
  end
end
