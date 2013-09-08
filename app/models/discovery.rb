class Discovery < ActiveRecord::Base
  extend FriendlyId
  friendly_id :person, use: :slugged

  validates_presence_of :title, :person, :content, :thumbnail
  validates_format_of :thumbnail, with: %r{(gif|jpg|png)\z}i,
    message: 'must be a GIF, JPG or PNG.'

  def slug_candidates
    [ :person, [ :person, :title ] ]
  end
end
