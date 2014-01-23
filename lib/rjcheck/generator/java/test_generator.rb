
require 'rjcheck/util/os'
class TestGenerator
	attr_accessor :java_map
	attr_accessor :dsl_model

	def initialize(java_map, dsl_model)
		@java_map = java_map
		@dsl_model = dsl_model
	end

	def generate
		puts '####### Generation of TestClasses begins'
		@java_map.each { |key, value|
			if @java_map.has_key?(key +'Test') || key.end_with?('Test')
				puts key + ' already has a Test (Test will not be generated)'
			else
				if value.is_a? JavaClass
					generate_test_class value
				end
			end
		}
	end

	private
	def generate_test_class(class_object)
		puts '####### generate Test for: ' +class_object.identifier

		path_to_class = class_object.package.gsub('.', '/')
		path_to_class = OS.replace_separator path_to_class
		#FAIL
		puts "#{@dsl_model.main_test_folder_path}#{path_to_class}"
		#FAIL
		path_to_class = "#{@dsl_model.main_test_folder_path}#{path_to_class}"
		FileUtils.mkdir_p path_to_class
		path_to_class = "#{path_to_class}/#{class_object.identifier}Test.java"
		path_to_class = OS.replace_separator path_to_class
		puts "write to: #{path_to_class}"

		template = File.read(File.join(File.dirname(__FILE__), '../../resources/test_class_template.erb'))

		File.open(path_to_class, 'w+') do |file|
			# use "\n" for two lines of text
			file << ERB.new(template).result(class_object.template_binding)
		end
	end
end