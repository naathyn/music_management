class Photo < ActiveRecord::Base
  belongs_to :album, touch: true

  validates_presence_of :title, :description, :thumbnail, :album_id
  #validates_format_of :thumbnail, with: %r{(gif|jpg|png)$}i,
    #message: 'must be a GIF, JPG or PNG.'

  default_scope order: 'title'

  def random_photo
    @random_photo ||= Photo.all.shuffle.first.thumbnail
  end
end
