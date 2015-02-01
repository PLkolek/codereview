class TextFile
  attr_reader :chunks

  def initialize(name, chunks)
    @chunks=chunks
    @name= name
  end
end
