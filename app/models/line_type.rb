class LineType
  attr_reader :type, :inNew, :inOld

  def initialize(type)
    @type = type
    @inNew = type!=:removed
    @inOld = type!=:added
  end

  def new_no(new_no)
    new_no if @inNew
  end

  def old_no(old_no)
    old_no if @inOld
  end
end