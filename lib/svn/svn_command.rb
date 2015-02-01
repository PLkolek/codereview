class SvnCommand
  def self.diff(url, revision_number)
    "svn diff -r #{revision_number-1}:#{revision_number}  #{url}"
  end

  def self.cat(url, file, revision_number)
    "svn cat -r #{revision_number-1} #{url}#{file}"
  end

  def self.log(url, user, title)
    return "svn log #{url} --search #{user} --search-and #{title}" if user.present? && title.present?
    return "svn log #{url} --search #{user}"                       if user.present? && title.blank?
    return "svn log #{url} --search #{title}"                      if user.blank?   && title.present?
    return "svn log #{url}"                                        if user.blank?   && title.blank?
  end
end