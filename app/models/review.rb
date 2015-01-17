class Review < ActiveRecord::Base
  has_many :revisions
  has_many :text_files

  def diff_command
    revision = revisions.first.number
    "svn diff -r #{revision-1}:#{revision}  #{url}"
  end
end