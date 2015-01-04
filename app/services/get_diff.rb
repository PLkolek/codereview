class GetDiff
  def call
    parsed = DiffParser.parse(%x(svn diff -r 15826:15827 http://svn.wildfiregames.com/public/ps/trunk/source/))
    chunks = parsed.elements.first.elements.drop 3
    result=[]
    for chunk in chunks
      result.concat(transform_chunk(chunk))
    end
    #FIXME: if line.last_line < total lines
    result << {:type => :more}
    result
  end

  def transform_chunk(chunk)
    result=[]
    line_new=line_old=chunk.first_line_number
    if chunk.first_line_number>1
      result << {:type => :more}
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