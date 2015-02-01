class LogInterpreter
  def to_model(log)
    log.elements.map { |commit|
      Commit.new(commit.revision,
                commit.author,
                commit.titlee)
    }
  end
end