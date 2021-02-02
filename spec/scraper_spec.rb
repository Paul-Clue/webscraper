# rubocop:disable Layout/LineLength

require './lib/scraper_interface'
require 'open-uri'
require 'nokogiri'

describe Scraper do
  let(:scrap) { Scraper.new('https://prosearch.tribeofnoise.com/search/index') }

  describe '#initialize and call instance variable' do
    it 'creates an instance of the scraper class' do
      expect(scrap.instance_of?(Scraper)).to be true
    end

    it 'requires an arguement' do
      expect { Scraper.new }.to raise_exception(an_instance_of(ArgumentError))
    end

    it 'can reference instance variables of the class' do
      expect(scrap.url).to eq('https://prosearch.tribeofnoise.com/search/index')
    end
  end

  describe '#container' do
    it 'refernces a tree of containers that lead to the values to be scraped' do
      check = scrap.container('main#main-content', 'div.o-container', 'div#search-results', 'table.c-table', 'tbody', 'tr#song_row_31951', 'td.c-table__cell', 'div.c-song', 'div.c-song__title')
      expect(check.text).to eq('Say Goodbye (ft.Doug Moore) Featured')
    end

    it 'raises error because #container must be passed an arguement' do
    expect { scrap.container() }.to raise_exception(an_instance_of(ArgumentError))
    end
  end
end

# rubocop:enable Layout/LineLength
