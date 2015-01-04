class ShowMore
  def call(from, to)
    file =%x(svn cat -r 15826 http://svn.wildfiregames.com/public/ps/trunk/source/ps/VideoMode.cpp)
    file.lines[from-1...to-1].each_with_index.map {|line, no| Line.new(line, :no_changes, no+from, no+from, '').to_hash}
  end
end