module SvnLog
  class Log < Treetop::Runtime::SyntaxNode
  end

  class Commit < Treetop::Runtime::SyntaxNode
    def revision
      elements.first.elements.first.text_value
    end
    def author
      elements.first.elements[1].text_value
    end
    def titlee
      elements.last.text_value
    end
  end

  class InfoLine < Treetop::Runtime::SyntaxNode
  end

  class SeparatorLine < Treetop::Runtime::SyntaxNode
  end

  class Revision < Treetop::Runtime::SyntaxNode
  end

  class Author < Treetop::Runtime::SyntaxNode
  end

  class Title < Treetop::Runtime::SyntaxNode
  end
end