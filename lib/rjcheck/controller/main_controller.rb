require 'rjcheck/generator/java/test_generator'
require 'rjcheck/analyzer/analyzer'
class MainController
	attr_accessor :folder
	attr_accessor :crawler
	attr_accessor :mapper
	attr_accessor :analyzer
	attr_accessor :dsl_object
	attr_accessor :java_map

  def initialize(controller)
		@java_map = Hash.new()
		@dsl_object = controller.dsl_object
		@dsl_controller = controller
		@crawler = JavaCrawler.new(@dsl_object.project_path)
		@mapper = JavaMapper.new()
		@analyzer = Analyzer.new()
  end

	def run
		file_list = crawl
		file_list.each { |key,value|  puts "\n\nLOG: key: #{key}\nvalue: #{value}"}
		map(file_list)
		@analyzer.analyse(java_map, @dsl_object)
	end

	def crawl
		puts "\n\n\n *** Crawl Java ***"
		file_list = Hash.new()
		@crawler.crawl {|path,file| file_list[path]=file}
		file_list
	end

  def map(file_list)
    @mapper.map(file_list)
    @java_map = @mapper.java_map

    if @dsl_object.generate_test_classes
      generator = TestGenerator.new(@java_map, @dsl_object)
      generator.generate
    end
  end

	# Analyze Code with @java_map and @dsl
end
