class Chunk
  attr_reader :lines, :old_begin, :old_end, :new_begin, :new_end

  def initialize(lines, old_begin, old_end, new_begin, new_end)
    @lines = lines
    @old_begin = old_begin
    @old_end = old_end
    @new_begin = new_begin
    @new_end = new_end
  end
end