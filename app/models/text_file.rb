class TextFile < ActiveRecord::Base
  belongs_to :review
  has_many :comments
end
