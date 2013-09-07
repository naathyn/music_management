class Article < ActiveRecord::Base
  include TimestampHelper
  validates_presence_of :content

  default_scope order: 'created_at DESC'

  def month; timestamp.split.first end
  def without_month; timestamp.gsub month, '' end
end
