#!/usr/bin/ruby

require 'nokogiri'
require 'httparty'
require 'open-uri'
require_relative '../lib/scraper_interface'

scrap = Scraper.new('https://prosearch.tribeofnoise.com/search/index')

check = scrap.container('main#main-content', 'div.o-container', 'div#search-results', 'table.c-table', 'tbody').children

output = []
head = 'Artist              |              Song'
skip = check[0].css('div.c-song__title').text
check.each_with_index do |_v, i|
  song4 = check[i].css('div.c-song__title').text
  song5 = check[i].css('a.c-song__artist').text
  next unless (song4 == skip) == false

  output.append("#{song5}                 #{song4}")
end
puts head
puts '--------------------------------------------------'
output.each do |v|
  puts "#{v}\n"
end
