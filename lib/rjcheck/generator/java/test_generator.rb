require 'rjcheck/dsl/controller/dsl_controller'
require 'rjcheck/dsl/controller/os'
class TestGenerator
	attr_accessor :java_map
	attr_accessor :dsl

	def initialize(java_map, dsl)
		@java_map = java_map
		@dsl = dsl
	end

	def generate
		puts '####### Generation of TestClasses begins'
		@java_map.each { |key, value|
			if @java_map.has_key?(key +'Test')
				puts key + ' already has a Test (Test will not be generated)'
			else
				generate_test_class value
			end
		}
	end

	private
	def generate_test_class(class_object)
		puts '####### generate Test for: ' +class_object.identifier

		path_to_class = class_object.package.gsub('.','/')
		puts OS.replace_separator path_to_class

		puts "#{@dsl.main_test_folder_path}#{path_to_class}"

		#File.open(@dsl.main_test_folder_path +path_to_class, 'w') do |file|
		#	# use "\n" for two lines of text
		#	file.puts "Test"
		#end
	end
end