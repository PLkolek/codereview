class LineType
  attr_reader :type, :inNew, :inOld

  def initialize(type)
    @type = type
    @inNew = type!=:removed
    @inOld = type!=:added
  end
end