#FIXME: Why do I need require?
require 'svn_diff.rb'
class DiffParser
  def self.parse(data)
    #FIXME: I'm sure this can be done in a better way
    base_path = File.expand_path(File.dirname(__FILE__))
    Treetop.load(File.join(base_path, 'diff.treetop'))
    @parser = SvnDiffParser.new
    tree = @parser.parse(data)
    # If the AST is nil then there was an error during parsing
    # we need to report a simple error message to help the user
    if(tree.nil?)
      raise Exception, "Parse error at offset: #{@parser.index}
      #{@parser.failure_reason}"
    end
    TreeCleaner.clean_tree tree
  end
end