class CommentAttacher
  def initialize(lines)
    @lines=lines
  end

  def attach(comments)
    comments.each do |comment|
      match_line(comment).comment=comment
    end
  end

  def match_line(comment)
    @lines.find { |line| line[:old_no] == comment.old_no and line[:new_no] == comment.new_no }
  end
end