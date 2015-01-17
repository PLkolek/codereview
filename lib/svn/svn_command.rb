class SvnCommand
  def self.diff(url, revision_number)
    "svn diff -r #{revision_number-1}:#{revision_number}  #{url}"
  end

  def self.cat(url, file, revision_number)
    "svn cat -r #{revision_number-1} #{url}#{file}"
  end
end