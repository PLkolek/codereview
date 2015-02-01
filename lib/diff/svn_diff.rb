module SvnDiff
  class Diff < Treetop::Runtime::SyntaxNode
  end

  class Index < Treetop::Runtime::SyntaxNode
  end

  class File < Treetop::Runtime::SyntaxNode
    def name
      elements.first.elements.first.text_value
    end
  end

  class FileName < Treetop::Runtime::SyntaxNode
  end

  class SeparatorLine < Treetop::Runtime::SyntaxNode
  end

  class Header < Treetop::Runtime::SyntaxNode
  end

  class Chunk < Treetop::Runtime::SyntaxNode
    CHUNK_HEADER_REGEXP = /@@ -(\d+),(\d+) \+(\d+),(\d+) @@/

    def old_begin
      CHUNK_HEADER_REGEXP.match(text_value.lines.first)[1].to_i
    end
    def old_end
      match = CHUNK_HEADER_REGEXP.match(text_value.lines.first)
      match[1].to_i+match[2].to_i
    end
    def new_begin
      CHUNK_HEADER_REGEXP.match(text_value.lines.first)[3].to_i
    end
    def new_end
      match = CHUNK_HEADER_REGEXP.match(text_value.lines.first)
      match[3].to_i+match[4].to_i
    end

  end

  class Line < Treetop::Runtime::SyntaxNode
    def type
      {
          ' '=>:no_changes,
          '+'=>:added,
          '-'=>:removed
      }[text_value[0]]
    end
    def content
      text_value[1..-1]
    end
  end
end