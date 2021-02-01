
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity

class scraper
  attr_reader :url

  def initialize (site_url)
    @url = site_url
  end

  def container(*tags)
    info = parse_url.css(tag_list[0])
    tags.each_with_index do |v, i|
      break if tags.length < 2

      iin = info.css(tags[i+1])
      info = inn
      break if i == tags.length - 2
    end
    info
  end  

    private
  def parse_url
    Nokogiri::HTML(URI.open(self.url))
  end  
end