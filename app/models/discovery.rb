class Discovery < ActiveRecord::Base
  validates_presence_of :title, :person, :content, :thumbnail
  validates_format_of :thumbnail, with: %r{(gif|jpg|png)\z}i,
    message: 'must be a GIF, JPG or PNG.'

  default_scope order: 'created_at DESC'
end
