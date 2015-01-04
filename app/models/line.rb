class Line
  attr_reader :text, :type, :new_no, :old_no, :comment

  def initialize(text, type, new_no, old_no, comment)
    @text=text
    @type=LineType.new type
    @new_no=new_no if @type.inNew
    @old_no=old_no if @type.inOld
    @comment=comment
  end

  def to_hash
    {
      :text => @text,
      :type => @type.type,
      :new_no => @new_no,
      :old_no => @old_no,
      :comment => @comment
    }
  end
end