class MainController
	attr_accessor :folder
	attr_accessor :crawler
	attr_accessor :mapper
	attr_accessor :dsl
  def initialize(controller)
		@dsl = controller
		@crawler = JavaCrawler.new(@dsl.p_folder.path)
		@mapper = JavaMapper.new()
  end

	def run
		file_list = crawl
		file_list.each { |key,value|  puts "\n\nLOG: key: #{key}\nvalue: #{value}"}
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
