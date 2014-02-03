require 'rjcheck/generator/java/test_generator'
require 'rjcheck/analyzer/analyzer'

# This class is responsible for all actions of RJCheck.
# It provides methods to access all components of RJCheck.
# E.g. Crawling for java-files, mapping java-files into the meta-model,
# analysing the structure of the project and generating of test-classes for the given project.
class MainController
	# The crawler-component
	attr_accessor :crawler
	# The mapper-component
	attr_accessor :mapper
	# The DSL model generated from the DSL component.
	attr_accessor :dsl_model
	# The java-file-map with all mapped java-files found by the mapper.
	attr_accessor :java_map
	# The analyzer-component
	attr_accessor :analyzer
	# The test-generator-component
	attr_accessor :generator

  def initialize
		@dsl_model = $RJ.dsl_model
		@java_map = Hash.new
		@crawler = JavaCrawler.new(@dsl_model.project_path)
		@mapper = JavaMapper.new
  end

	# This method executes RJCheck.
	# It will crawl, map and analyse the project which is discribed in the DSL.
	#
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
	# This method calls the crawler-component which will recursively read all java-files in the given folder.
	def crawl
		puts "\n\n\n *** Crawl Java ***"
		file_list = Hash.new
		@crawler.crawl {|path,file| file_list[path]=file}
		file_list
	end

	# This method calls the mapper-component which will map the java-files to the meta-model and returning it.
  def map(file_list)
    @mapper.map(file_list)
    @mapper.java_map
  end

	# This method calls the analyzer-component which will analyse the structure of the given project.
	def analyze
		@analyzer.analyze
	end

	# This method calls the test-genarator-component which will generate test-classes for the given project.
	def generate_tests
		if @dsl_model.generate_test_classes
      @generator.generate
    end
	end

end
