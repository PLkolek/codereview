class Review < ActiveRecord::Base
  has_many :revisions
  has_many :text_files

  def lines
    parsed = DiffParser.parse(%x(#{diff_command}))
    DiffInterpreter.new.to_model parsed
  end

  def show_more(from, to, old_new_difference)
    file =%x(#{cat_command})
    file.lines[from-1...to-1]
    .each_with_index
    .map {|line, no| Line.new(line, :no_changes, no+from+old_new_difference, no+from, '').to_hash}
  end

  #TODO: that should go to another class...
  private
  def diff_command
    revision = revisions.first.number
    "svn diff -r #{revision-1}:#{revision}  #{url}"
  end

  def cat_command
    revision = revisions.first.number-1
    file=text_files.first.name
    "svn cat -r #{revision} #{url}#{file}"
  end

end