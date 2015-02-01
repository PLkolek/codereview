class Review < ActiveRecord::Base
  has_many :revisions, -> { order(number: :asc) }
  has_many :comments

  validates_presence_of :name

  def files
    #TODO: combined diff instead of range of revisions
    parsed = Parser.diffParser.parse(%x(#{diff_command}))
    DiffInterpreter.new(Comment.all).to_model parsed
  end

  def show_more(file_name, from, to, old_new_difference)
    file =%x(#{cat_command(file_name)})
    file.lines[from-1..to-1]
    .each_with_index
    .map {|line, no| Line.new(line, LineType.new(:no_changes), no+from+old_new_difference, no+from, '')}
  end

  private
  def diff_command
    command = SvnCommand.diff(url, revisions.first.number, revisions.last.number)
    logger.debug(command)
    command
  end

  def cat_command(file_name)
    SvnCommand.cat(url, file_name, revisions.first.number)
  end

end