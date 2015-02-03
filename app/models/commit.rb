require 'diff/parser'
class Commit
  attr_reader :revision, :author, :title

  def initialize(revision, author, title)
    @revision = revision
    @author = author
    @title = title
  end

  def self.find(params)
    raise "url must be filled" if params[:url].blank?
    log = FakeSvn.log(params[:url], params[:author], params[:title])
    LogInterpreter.new.to_model Parser.logParser.parse(log)
  end
end