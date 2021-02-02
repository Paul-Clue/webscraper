# lib/scraper_interface.rb

class Scraper
  attr_accessor :url

  def initialize(site_url)
    @url = site_url
  end

  def container(*tags)
    info = parse_url.css(tags[0])
    tags.each_with_index do |_v, i|
      break if tags.length < 2

      iin = info.css(tags[i + 1])
      info = iin
      break if i == tags.length - 2
    end
    info
  end

  private

  def parse_url
    Nokogiri::HTML(URI.open(url))
  end
end
