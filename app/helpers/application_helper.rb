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

    case options[:image_quality]
    when "low_thumb"
      url = obj.asset.url(:low_thumb)
    when "thumb"
      url = obj.asset.url(:thumb)
    when "perview"
      url = obj.asset.url(:perview)
    when "low_banner"
      url = obj.asset.url(:low_banner)
    when "banner"
      url = obj.asset.url(:banner)
    else
      url = obj.asset_url
    end

    case options[:data_src]
    when "low_thumb"
      data_src = obj.asset.url(:low_thumb)
    when "thumb"
      data_src = obj.asset.url(:thumb)
    when "perview"
      data_src = obj.asset.url(:perview)
    when "low_banner"
      data_src = obj.asset.url(:low_banner)
    when "banner"
      data_src = obj.asset.url(:banner)
    else
      data_src = obj.asset_url
    end
    if html[:data_lazy].present?
      image_tag("", width: html[:width], alt: "#{obj.alt}", title: "#{obj.title}", class: html[:class], "data-src": html[:data_src], "data-lazy": url)
    else
      image_tag(url, width: html[:width], alt: "#{obj.alt}", title: "#{obj.title}", class: html[:class], "data-src": html[:data_src])
    end
  end
end
