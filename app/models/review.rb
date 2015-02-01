class Review < ActiveRecord::Base
  has_many :revisions
  has_many :text_files

  validates_presence_of :name

  def chunks
    parsed = Parser.parse(%x(#{diff_command}))
    DiffInterpreter.new(Comment.all).to_model parsed
  end

  def show_more(from, to, old_new_difference)
    file =%x(#{cat_command})
    file.lines[from-1..to-1]
    .each_with_index
    .map {|line, no| Line.new(line, LineType.new(:no_changes), no+from+old_new_difference, no+from, '')}
  end

  private
  def diff_command
    command = SvnCommand.diff(url+text_files.first.name, revisions.first.number)
    logger.debug(command)
    command
  end

  def cat_command
    SvnCommand.cat(url, text_files.first.name, revisions.first.number)
  end

end