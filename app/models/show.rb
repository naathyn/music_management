class Show < ActiveRecord::Base
  validates_presence_of :date, :venue, :address
  validates_numericality_of :price, allow_nil: true, allow_blank: true

  before_save { |show| show.price = nil if show.price == 0 }

  default_scope order: 'created_at DESC'

  def price_for_show
    price.nil? ? "Free!" : "$#{price}"
  end

  def date_for_show
    d = date.to_formatted_s(:long_ordinal).gsub(/\d+:\d+/, '').strip
    t = date.to_formatted_s(:short).split.last.strip
    "#{d} at #{t}"
  end
end
