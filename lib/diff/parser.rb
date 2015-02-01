#FIXME: Why do I need require?
require 'svn_diff.rb'
require 'svn_log.rb'
class Parser
  def initialize(grammarFile, parserName)
    @grammarFile = grammarFile
    @parserName = parserName
  end

  def parse(data)
    #FIXME: I'm sure this can be done in a better way
    base_path = File.expand_path(File.dirname(__FILE__))
    Treetop.load(File.join(base_path, @grammarFile))
    parser = Object.const_get(@parserName).new
    tree = parser.parse(data)
    # If the AST is nil then there was an error during parsing
    # we need to report a simple error message to help the user
    if (tree.nil?)
      raise Exception, "Parse error at offset: #{parser.index}
      #{parser.failure_reason}"
    end
    TreeCleaner.clean_tree tree
  end

  def self.diffParser()
    Parser.new('diff.treetop', 'SvnDiffParser');
  end

  def self.logParser()
    Parser.new('log.treetop', 'SvnLogParser');
  end
end