module ApplicationHelper

  def full_title(page_title)
    base_title = "Sam Raines Music"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}".html_safe
    end
  end

  def render_logo_for_site
    logo = [
            "logo_1.png",
            "logo_2.png",
            "logo_3.png",
            "logo_3_color.png",
            "logo_5.png"
          ].shuffle!.first

      link_to image_tag(logo), :home
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
    return true if user_agent.match %r{(mobile|ipad|iphone|android|tablet|phone)}
  end

  def device_can_play?(audio_type)
    case TrueClass
      when audio_type == device
      when 'mp3' && %w{mac iphone ipad ipod msie chrome}.include?(device)
      when 'ogg' && %w{mozilla opera}.include?(device)
    end
  end

  def image_for(thumbnail)
    "background-image: url(#{thumbnail});" if device_is_mobile?
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

  def actions_for(item)
    # in-progress
    item = item.class.name.downcase
    html = <<-HTML
      <ul class="share-actions pull-right">
        <li>
          <a href="<%= new_#{item}_path %>"
              data-remote="true" title="New #{item.capitalize}">
            <i class="icon-file"> </i>
          </a>
        </li>
        <li>
          <a href="<%= edit_#{item}_path(#{item}) %>"
              data-remote="true" title="Edit #{item.capitalize}">
            <i class="icon-pencil"> </i>
          </a>
        </li>
        <li>
          <a href="<%= #{item}_path(#{item}) %>" data-method="delete"
              data-remote="true" data-confirm="Are you sure?"
              title="Delete #{item.capitalize}">
            <i class="icon-trash"> </i>
          </a>
        </li>
      </ul>
    HTML
    html.html_safe
  end
end
