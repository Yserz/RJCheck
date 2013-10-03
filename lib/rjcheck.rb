#!/usr/bin/ruby

require 'bundler/setup'
Bundler.require(:default)
require_relative 'rjcheck/meta_model/java/class'
require_relative 'rjcheck/meta_model/java/interface'
require_relative 'rjcheck/meta_model/java/method'

require_relative 'rjcheck/crawler/crawler'
require_relative 'rjcheck/crawler/java/java_crawler'
require_relative 'rjcheck/mapper/java/java_mapper'


puts "Please enter the folder of the project: "
#folder = gets.chomp
folder = "/Users/MacYser/Documents/Workspaces/NetBeansWorkspace/Zeta/zeta-server/"#src/main/java/com/wearezeta/server/http/exception/"
folder = "/Users/MacYser/Documents/Workspaces/NetBeansWorkspace/JavaTestApp"

#puts "\n\n\n *** Crawl everything ***"
#crawler = Crawler.new(folder)
#crawler.crawl {|file| puts "InData: #{file}"}

puts "\n\n\n *** Crawl Java ***"
javacrawler = JavaCrawler.new(folder)
javamapper = JavaMapper.new()
file_list = Hash.new()
javacrawler.crawl {|path,file| file_list[path]=file}
#file_list.each { |key,value|  puts "key: #{key}\nvalue: #{value}"}
file_list.each { |key,value|  javamapper.map_file(key,value)}
