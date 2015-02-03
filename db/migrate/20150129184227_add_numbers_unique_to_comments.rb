class AddNumbersUniqueToComments < ActiveRecord::Migration
  def change
    add_index :comments, [:old_no, :new_no], :unique => true
  end
end
