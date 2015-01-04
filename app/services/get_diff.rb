class GetDiff
  def call
    parsed = DiffParser.parse(%x(svn diff -r 15826:15827 http://svn.wildfiregames.com/public/ps/trunk/source/))
    chunks = parsed.elements.first.elements.drop 3
    result=[]
    for chunk in chunks
      line_new=line_old=chunk.first_line_number
      if chunk.first_line_number>1
        result << {:type => :more}
      end
      for line in chunk.elements
        result<< {:type => line.type, :old_no=>line_old, :new_no=>line_new,  :text=>line.content, :comment=>''}
        case line.type
          when :no_changes
            line_new+=1
            line_old+=1
          when :added
            line_new+=1
          when :removed
            line_old+=1
        end
      end
    end
    #FIXME: if line.last_line < total lines
    result << {:type => :more}
    result
  end
end