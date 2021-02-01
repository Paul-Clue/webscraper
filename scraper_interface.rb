
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity

class scraper
  attr_reader :url

  def initialize (site_url)
    @url = site_url
  end

  def container(*tags)
    tag_list = []
    tag_list = tags
    address = ""
    a = parse_url.css(tag_list[0])

    tag_list.each do |v|
      comma = "#{v}" + ", "
      address.concat(comma)
    end
    a.css(tag)
  end  

    private
  def parse_url
    Nokogiri::HTML(URI.open(self.url))
  end  
end