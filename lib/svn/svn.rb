class Svn
  def self.diff(url, revision_first, revision_last)
    %x(svn diff -r #{revision_first-1}:#{revision_last}  #{url})
  end

  def self.cat(url, file, revision_number)
    %x(svn cat -r #{revision_number-1} #{url}#{file})
  end

  def self.log(url, user, title)
    return %x(svn log #{url} --search #{user} --search-and #{title}) if user.present? && title.present?
    return %x(svn log #{url} --search #{user})                       if user.present? && title.blank?
    return %x(svn log #{url} --search #{title})                      if user.blank?   && title.present?
    return %x(svn log #{url}")                                        if user.blank?   && title.blank?
  end
end