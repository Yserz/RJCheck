# To change this template, choose Tools | Templates
# and open the template in the editor.
#
#
#
#

class MapperTest
	attr_accessor :folder
	#attr_accessor :crawler
	attr_accessor :mapper
	
  def initialize(folder)
		@folder = folder
		#@crawler = JavaCrawler.new(@folder)
		@mapper = JavaMapper.new()
  end

	def run

		#puts "\n\n\n *** Crawl everything ***"
		#crawler = Crawler.new(folder)
		#crawler.crawl {|file| puts "InData: #{file}"}

		#file_list = crawl
		#file_list.each { |key,value|  puts "\n\nLOG: key: #{key}\nvalue: #{value}"}
		
		map(file_list)
	end

	def crawl
		puts "\n\n\n *** Crawl Java ***"
		file_list = Hash.new()
		@crawler.crawl {|path,file| file_list[path]=file}
		file_list
	end

	def map(file_list)
		@mapper.map(file_list)
	end
end