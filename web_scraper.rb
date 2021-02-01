#! /usr/bin/env ruby

require 'nokogiri'
require 'httparty'
require 'byebug'
require 'open-uri'

# Scoreboard_content__2hMP-__web-inspector-hide-shortcut__'
# div.ml-bs-u
# https://github.com/sparklemotion/mechanize

def scraper
  url = 'https://prosearch.tribeofnoise.com/search/index'
  # raw_page = HTTParty.get(url)
  # noko_page = Nokogiri::HTML(url)
  noko_page = Nokogiri::HTML(URI.open(url))

  d1 = noko_page.css('div.main-wrapper')
  d2 = d1.css('main#main-content')
  d3 = d1.css('div.o-container')
  d4 = d3.css('div#search-results')
  d5 = d4.css('table.c-table')
  d6 = d5.css('tbody').children
  d7 = d6.css('tr#song_row_31951')
  d8 = d7.css('td.c-table__cell')
  d9 = d8.css('div.c-song')
  d10 = d9.css('div.c-song__title')
  d11 = d10.css('a.c-song__artist')
  # d4 = d3.css('')
  # d4 = d3.css('')
  # d4 = d3.css('')
  # d4 = d3.css('')
  # byebug

  song_list ={}
  output = []
  head = "Artist              |              Song"
  skip = d6[0].css('div.c-song__title').text
  d6.each_with_index do |v, i|
    song4 = d6[i].css('div.c-song__title').text
    song5 = d6[i].css('a.c-song__artist').text
    next unless (song4 == skip) == false

    song_list.merge!(song5 => song4)
    output.append("#{song5}                 #{song4}")
  end  
  puts head
  puts "--------------------------------------------------"
  output.each do |v|
    puts "#{v}\n"
  end 

end  

scraper




# Fetch and parse HTML document
# doc = Nokogiri::HTML(URI.open('https://nokogiri.org/tutorials/installing_nokogiri.html'))
# doc = Nokogiri::HTML(URI.open('https://www.espn.com/nba/scoreboard/_/date/20210129'))


# Search for nodes by css
# doc.css('nav ul', 'article h2').each do |link|
#   puts link.content
# end

# doc.css('section.col-b article tr.away').each do |link|
#   puts link.content
# end


# Search for nodes by xpath
# doc.xpath('//nav//ul.menu//li/a', '//article//h2').each do |link|
#   puts link.content
# end

# # Or mix and match
# doc.search('nav ul.menu li a', '//article//h2').each do |link|
#   puts link.content
# end