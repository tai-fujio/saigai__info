module ApplicationHelper
  require "uri"

  def url_to_link(text)
    text.gsub!(/\n/, '<br/>')
    text.gsub!(/[[:space:]]/, '<br/>')
    URI.extract(text, ['http','https'] ).uniq.each do |url|
      sub_text = ""
      sub_text << "<a href=" << "\"" << url << "\"" << " target=\"_blank\">" << url << "</a>"
      text.gsub!(url, sub_text)
    end
    return text
  end
end
