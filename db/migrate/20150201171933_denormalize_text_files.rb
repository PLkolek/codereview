class DenormalizeTextFiles < ActiveRecord::Migration
  def change
    drop_table :text_files
    remove_column :comments, :text_file_id
    add_column :comments, :file_name, :string
  end
end
