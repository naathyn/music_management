class Blog < ActiveRecord::Base
  include TimestampHelper
  attr_writer :tag_names

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  validates_presence_of :title, :content

  after_save :assign_tags

  default_scope order: 'created_at DESC'

  def tag_names
    @tag_names || tags.map(&:name).sort.join(', ')
  end

private

  def assign_tags
    if @tag_names
      self.tags = @tag_names.split(/\,/).map { |name|
        Tag.find_or_create_by_name!(name.gsub(/\s+/, '').downcase.strip)
      }
    end
  end
end
