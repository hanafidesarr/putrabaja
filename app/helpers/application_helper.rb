module ApplicationHelper
  def device
    agent = request.user_agent
    return "tablet" if agent =~ /(tablet|ipad)|(android(?!.*mobile))/i
    return "mobile" if agent =~ /Mobile/
    return "desktop"
  end
  def arbre(&block)
    Arbre::Context.new({}, self, &block).to_s.html_safe
  end

  def manipulate_image_tag(obj, options: {}, html: {})
    # use online image if exist
    url = obj.url_image&.strip.presence || render_image_quality(obj, options[:image_quality])
    
    img_not_found = html[:img_not_found].present? ? "this.onerror=null;this.src='#{html[:img_not_found]}';" : "this.onerror=null;this.src='/assets/image_not_found.png';" 

    if html[:data_lazy].present?
      image_tag("", width: html[:width], alt: "#{obj.alt.presence || strip_tags(obj.title)}", title: "#{strip_tags(obj.title)}", class: html[:class], style: html[:style], "data-src": html[:data_src], "data-lazy": url, onerror: img_not_found)
    else
      image_tag(url, width: html[:width], alt: "#{obj.alt.presence || strip_tags(obj.title)}", title: "#{strip_tags(obj.title)}", class: html[:class], style: html[:style], "data-src": html[:data_src], width: obj.width.presence || '100%', height: obj.height.presence || 'auto', onerror: img_not_found)
    end
  end

  def manipulate_image_tag_url(obj, options: {}, html: {})
    # use online image if exist 
    url = obj.url_image&.strip.presence || render_image_quality(obj, options[:image_quality]) 

    img_not_found = html[:img_not_found].present? ? "this.onerror=null;this.src='#{html[:img_not_found]}';" : "this.onerror=null;this.src='/assets/image_not_found.png';" 
    if html[:data_lazy].present?
      image_url("", width: html[:width], alt: "#{obj.alt.presence || strip_tags(obj.title)}", title: "#{strip_tags(obj.title)}", class: html[:class], style: html[:style], "data-src": html[:data_src], "data-lazy": url, onerror: img_not_found)
    else
      image_url(url, width: html[:width], alt: "#{obj.alt.presence || strip_tags(obj.title)}", title: "#{strip_tags(obj.title)}", class: html[:class], style: html[:style], "data-src": html[:data_src], onerror: img_not_found)
    end
  end

  def render_image_quality(obj, option = nil)
    case option
    when "low_thumb"
      return obj.asset.url(:low_thumb)
    when "thumb"
      return obj.asset.url(:thumb)
    when "perview"
      return obj.asset.url(:perview)
    when "low_banner"
      return obj.asset.url(:low_banner)
    when "banner"
      return obj.asset.url(:banner)
    else
      return obj.asset_url
    end
  end 
end
