require 'rjcheck/generator/java/test_generator'
require 'rjcheck/analyzer/analyzer'
class MainController
	attr_accessor :crawler
	attr_accessor :mapper
	attr_accessor :dsl_model
	attr_accessor :java_map
	attr_accessor :analyzer
	attr_accessor :generator

  def initialize
		@dsl_model = $RJ.dsl_model
		@java_map = Hash.new
		@crawler = JavaCrawler.new(@dsl_model.project_path)
		@mapper = JavaMapper.new
  end

	def run
		file_list = crawl
		file_list.each { |key,value|  puts "\n\nLOG: key: #{key}\nvalue: #{value}"}
		@java_map = map(file_list)

		@analyzer = Analyzer.new(@java_map, @dsl_model)
		@generator = TestGenerator.new(@java_map, @dsl_model)

		analyze
		generate_tests
	end

	private
	def crawl
		puts "\n\n\n *** Crawl Java ***"
		file_list = Hash.new
		@crawler.crawl {|path,file| file_list[path]=file}
		file_list
	end

  def map(file_list)
    @mapper.map(file_list)
    @mapper.java_map
  end

	def analyze
		@analyzer.analyse
	end

	def generate_tests
		if @dsl_model.generate_test_classes
      @generator.generate
    end
	end

end
