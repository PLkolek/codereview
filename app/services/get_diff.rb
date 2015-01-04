class GetDiff
  def call
    parsed = DiffParser.parse(%x(svn diff -r 15826:15827 http://svn.wildfiregames.com/public/ps/trunk/source/))
    chunks = parsed.elements.first.elements.drop 3
    result=[]
    last_chunk_end=1
    chunks.each { |chunk|
      result.concat(transform_chunk(chunk, last_chunk_end))
      last_chunk_end=chunk.old_end
    }
    #FIXME: if line.last_line < total lines
    result << {:type => :more, :from=>last_chunk_end, :to=>99999999}
    result
  end

  def transform_chunk(chunk, last_chunk_end)
    result=[]
    line_old=chunk.old_begin
    line_new=chunk.new_begin
    if chunk.old_begin>last_chunk_end
      result << {:type => :more, :from => last_chunk_end, :to => chunk.old_begin}
    end
    for parsed_line in chunk.elements
      line = Line.new(parsed_line.content, parsed_line.type, line_new, line_old, '')
      result<<line.to_hash
      line_new+=1 if line.type.inNew
      line_old+=1 if line.type.inOld
    end
    result
  end
end