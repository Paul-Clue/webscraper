
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity

class scraper
  attr_reader :url

  def initialize (site_url)
    @url = site_url
  end

  

    private
  def parse_url
    Nokogiri::HTML(URI.open(self.url))
  end  
end