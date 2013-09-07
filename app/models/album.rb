class Album < ActiveRecord::Base
  validates_presence_of :name

  has_many :photos, dependent: :destroy
  default_scope order: 'updated_at DESC'

  def random_photos
    @random_photos ||= photos.all.shuffle!
  end

  def random_photo
    random_photos.first
  end

  def random_thumbnail
    random_photos.last.thumbnail
  end
end
