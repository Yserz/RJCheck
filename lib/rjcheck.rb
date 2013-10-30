#!/usr/bin/ruby

require 'bundler/setup'
Bundler.require(:default)
require_relative 'rjcheck/meta_model/java/java_class'
require_relative 'rjcheck/meta_model/java/java_interface'
require_relative 'rjcheck/meta_model/java/method'

require_relative 'rjcheck/crawler/crawler'
require_relative 'rjcheck/crawler/java/java_crawler'
require_relative 'rjcheck/mapper/java/java_mapper'


puts 'Please enter the folder of the project: '
folder = gets.chomp


#puts "\n\n\n *** Crawl everything ***"
#crawler = Crawler.new(folder)
#crawler.crawl {|file| puts "InData: #{file}"}

puts "\n\n\n *** Crawl Java ***"
java_crawler = JavaCrawler.new(folder)
java_mapper = JavaMapper.new()
file_list = Hash.new()
java_crawler.crawl {|path,file| file_list[path]=file}
#file_list.each { |key,value|  puts "key: #{key}\nvalue: #{value}"}
file_list.each { |key,value|  java_mapper.map_file(key,value)}
puts file_list.size