module ApplicationHelper

  def full_title(page_title)
    base_title = "Sam Raines Music"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}".html_safe
    end
  end

  def user_agent
    @user_agent ||= begin
      request.env['HTTP_USER_AGENT'].downcase
    rescue NilClass; end
  end

  def device
    @device ||= begin
      case user_agent
        when %r{(mac|ipad|iphone|ipod|chrome|msie)}
          'mp3'
        when %r{(opera|mozilla)}
          'ogg'
      end
    rescue NilClass; end
  end

  def device_is_mobile?
    return user_agent.match(%r{(mobile|ipad|iphone|android|tablet|phone)}) ? true : false
  end

  def device_can_play?(audio_type)
    case TrueClass
      when audio_type == device
      when 'mp3' && %w{mac iphone ipad ipod msie chrome}.include?(device)
      when 'ogg' && %w{mozilla opera}.include?(device)
    end
  end

  def player_for(song)
    song = song.downcase.gsub(/\s/, '_')
    case device
      when 'mp3'
        audio_tag asset_path("#{song}.mp3"), controls: true
      when 'ogg'
        audio_tag asset_path("#{song}.ogg"), controls: true
    end
  end

  def wrapper_for(player)
    content_tag(:div, player, id: 'player')
  end
end
