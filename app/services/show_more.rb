class ShowMore
  def call(from, to, old_new_difference)
    file =%x(svn cat -r 15826 http://svn.wildfiregames.com/public/ps/trunk/source/ps/VideoMode.cpp)
    file.lines[from-1...to-1]
        .each_with_index
        .map {|line, no| Line.new(line, :no_changes, no+from+old_new_difference, no+from, '').to_hash}
  end
end