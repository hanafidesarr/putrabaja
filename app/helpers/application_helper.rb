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
    url = obj.url_image.presence || render_image_quality(obj, options[:image_quality])
    data_src = self.render_image_quality(obj, options[:data_src])
    if html[:data_lazy].present?
      image_tag("", width: html[:width], alt: "#{obj.alt || obj.title}", title: "#{obj.title}", class: html[:class], style: html[:style], "data-src": html[:data_src], "data-lazy": url)
    else
      image_tag(url, width: html[:width], alt: "#{obj.alt || obj.title}", title: "#{obj.title}", class: html[:class], style: html[:style], "data-src": html[:data_src])
    end
  end

  def manipulate_image_tag_url(obj, options: {}, html: {})
    # use online image if exist 
    url = obj.url_image.presence || render_image_quality(obj, options[:image_quality]) 

    
    if html[:data_lazy].present?
      image_url("", width: html[:width], alt: "#{obj.alt || obj.title}", title: "#{obj.title}", class: html[:class], "data-src": html[:data_src], "data-lazy": url)
    else
      image_url(url, width: html[:width], alt: "#{obj.alt || obj.title}", title: "#{obj.title}", class: html[:class], "data-src": html[:data_src])
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
