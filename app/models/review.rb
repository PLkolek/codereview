class Review < ActiveRecord::Base
  has_many :revisions, -> { order(number: :asc) }
  has_many :comments, :dependent => :destroy

  validates_presence_of :name

  def files
    #TODO: combined diff instead of range of revisions
    parsed = Parser.diffParser.parse(FakeSvn.diff(url, revisions.first.number, revisions.last.number))
    DiffInterpreter.new(comments).to_model parsed
  end

  def show_more(file_name, from, to, old_new_difference)
    file =FakeSvn.cat(url, file_name, revisions.first.number)
    file.lines[from-1..to-1]
    .each_with_index
    .map {|line, no| Line.new(line, LineType.new(:no_changes), no+from+old_new_difference, no+from, '')}
  end

end